function [ lineTag, rmin ] = Solve_Assignment( priceMatrix )
% [ baseMatrix, rmin ] = Solve_Assignment( priceMatrix )
% ʹ���������㷨���ָ������
%������
% priceMatrix   ÿ����ɸ�����Ŀ�Ļ��ѣ�һ�б�ʾһ���ˣ�ÿһ�д���ͬ����Ŀ��Ҫ����������ȣ�
%����ֵ��
% lineTag       ָ�ɷ�����lineTag(i)=j ��ʾ�� i ����ִ�е� j ������
% rmin          ��С����
%����:
% [a,b]=Solve_Assignment([5 9 11 22 17; 24 23 11 5 18; 14 7 8 20 12; 4 22 16 3 25; 4 7 8 3 12;])
% [a,b]=Solve_Assignment([10 5 15 20 Inf;2 10 5 15 2; 3 15 14 13 3; 15 2 7 Inf 2; 9 4 15 8 4])
    global N;
    N = length(priceMatrix);
    iterMatrix = zeros(N);
    init_stack(2*N)

    % Լ��
    for i = 1:N; iterMatrix(i,:) = priceMatrix(i,:) - min(priceMatrix(i,:)); end

    % �������
    global ZeroTag;
    global LineTag;
    i=1;
    while 1
        i = i+1;
        if i> 5000; disp('ѭ�������������ơ�'); lineTag= 0; rmin = 0; return; end
        init_global(iterMatrix)
        zeroCount = sum(sum(iterMatrix==0));
        scan_line
        scan_column
        while sum(ZeroTag) < zeroCount
            scan_multi
            scan_line
            scan_column
        end
        if sum(LineTag==0) == 0; break; end
        % ����仯
        [x0, y0, y1] = calc_index();
        m = min(min(iterMatrix(x0,y0)));
        iterMatrix(x0,:) = iterMatrix(x0,:) - m;
        iterMatrix(:,y1) = iterMatrix(:,y1) + m;
    end
    lineTag = LineTag;
    rmin = 0;
    for i = 1:N; rmin = rmin + priceMatrix(i,LineTag(i)); end
end

function [x0, y0, y1] = calc_index()
    global LineTag; global ColumnTag; global IterMatrix; global N;
    clear()
    for i = 1:N; if LineTag(i) == 0; push(1,i); end; end
    while ~empty()
        [type, index] = pop();
        if type == 1 % �У�����ջ
            for k = 1:N
                if IterMatrix(index,k) == -1 && ColumnTag(k)>=0 && LineTag(index) ~= k; push(2, k); end
            end
        else % �У�����ջ
            if ColumnTag(index)>0 && LineTag(ColumnTag(index))>0; LineTag(ColumnTag(index)) = 0; push(1,ColumnTag(index)); end  % ����� 
            ColumnTag(index) = -1; % �����
        end
    end
    x0 = zeros(1,N);
    y0 = zeros(1,N);
    y1 = zeros(1,N);
    idx0 = 0; idx1 = 0;
    for i = 1:N; if LineTag(i) == 0; idx0 = idx0 + 1; x0(idx0) = i;end; end
    x0 = x0(1:idx0);
    idx0 = 0;
    for i = 1:N; if ColumnTag(i) ~= -1; idx0 = idx0 + 1; y0(idx0) = i; else idx1 = idx1 + 1; y1(idx1) = i; end; end
    y0 = y0(1:idx0); y1 = y1(1:idx1);
end

function init_global(iterMatrix)
    % �������
    global LineTag;
    global ColumnTag;
    global ZeroTag;
    global MultiTag;
    global N;
    global IterMatrix;
    
    LineTag = zeros(N,1);   % ��ŵ�ǰ�л�0������
    ColumnTag = zeros(1,N); % ��ŵ�ǰ�л�0������
    ZeroTag = zeros(1,N);   % ��ŵ� i �� 0 �ĸ���
    MultiTag = zeros(1,N);  % ��ŵ� i �е� 0 ����1��ʱ���׸�0������
    IterMatrix = iterMatrix;
end

function scan_line()
    global LineTag; global ColumnTag; global ZeroTag; global MultiTag; global N; global IterMatrix;
    for i = 1:N
        if LineTag(i) > 0; continue; end
        for z = 1:N; % ɨ�����е� 0 Ԫ�������ñ��
            if IterMatrix(i,z) == 0; if LineTag(i) == 0; LineTag(i) = z; else MultiTag(i) = LineTag(i); LineTag(i) = 0; break; end; end
        end
        if LineTag(i) % ������ 0 ԪΨһ
            ColumnTag(LineTag(i)) = i;
            for j = 1:N % ȥ�� 0 Ԫ�����е� 0 Ԫ
                if IterMatrix(j,LineTag(i)) == 0; IterMatrix(j,LineTag(i)) = -1; ZeroTag(LineTag(i)) = ZeroTag(LineTag(i)) + 1; end
            end
        end
    end
end

function scan_column()
    global LineTag; global ColumnTag; global ZeroTag; global MultiTag; global N; global IterMatrix;
    for i = 1:N
        if ColumnTag(i) > 0; continue; end
        for z = 1:N; % ɨ�����е� 0 Ԫ�������ñ��
            if IterMatrix(z,i) == 0; if ColumnTag(i) == 0; ColumnTag(i) = z; else ColumnTag(i) = 0; break; end; end
        end
        if ColumnTag(i) % ������ 0 ԪΨһ
            LineTag(ColumnTag(i)) = i;
            MultiTag(ColumnTag(i)) = 0;
            for j = 1:N % ȥ�� 0 Ԫ�����е� 0 Ԫ
                if IterMatrix(ColumnTag(i),j) == 0; IterMatrix(ColumnTag(i),j) = -1; ZeroTag(j) = ZeroTag(j) + 1; end
            end
        end
    end
end

function scan_multi()
    global LineTag; global ColumnTag; global ZeroTag; global MultiTag; global N; global IterMatrix;
    for i = 1:N
        if MultiTag(i) == 0; continue; end
        LineTag(i) = MultiTag(i);
        MultiTag(i) = 0;
        ColumnTag(LineTag(i)) = i;
        for j = LineTag(i):N % ȥ����ǰ�к���� 0 Ԫ
            if IterMatrix(i,j) == 0; IterMatrix(i,j) = -1; ZeroTag(j) = ZeroTag(j) + 1; end
        end
        for j = 1:N % ȥ�� 0 Ԫ�����е� 0 Ԫ
            if IterMatrix(j,LineTag(i)) == 0; IterMatrix(j,LineTag(i)) = -1; ZeroTag(LineTag(i)) = ZeroTag(LineTag(i)) + 1; end
        end
        break;
    end
end

function init_stack(M); global STACK; global STACK_LENGTH; global STACK_END; STACK = zeros(M,2); STACK_LENGTH = M; STACK_END = 0; end
function push(t, i); global STACK; global STACK_LENGTH; global STACK_END; if STACK_END+1 <= STACK_LENGTH; STACK_END = STACK_END + 1; STACK(STACK_END,1) = t; STACK(STACK_END,2) = i; else disp('Warning: StackOverflow!'); end; end
function [t, i] = pop(); global STACK; global STACK_END; if STACK_END > 0; t = STACK(STACK_END,1); i = STACK(STACK_END,2); STACK_END = STACK_END - 1; else disp('Warning: Stack is empty!'); end; end
function clear(); global STACK_END; STACK_END = 0; end
function [r] = empty(); global STACK_END; r = STACK_END == 0; end
