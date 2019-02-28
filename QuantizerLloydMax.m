%generate 5000 random points from the standard normal distribution
samples = normrnd(0,1,[1,5000]);

%Enter the rate here (bits/sample)
rate = 3;
N = 2.^rate;

%Stoping threshold 
eps = 0.001;

%Pick initial codepoints to be evenly spaced out on the interval 
codepoints = linspace(0,1,N);

%Call the recursive function to find the codepoints for the LLoyd Max
%quantization
codepts = find_quantization_points(samples, N, codepoints);

function [code_pts] = find_quantization_points(samples, N, codepoints)
    mth_distor = [];
    m_pls_1_distor = [];
    %N bins for Ri, i=1,...,N
    bins = cell(1, N);
    %For each sampled point 
    for i=1:5000
        %Given the ith value
        value = samples(i);
        %Compute it's absolute distance to each of the codepoints
        distances = abs(value - codepoints);
        %Find the minimum distance 
        [error, I] = min(distances);
        bins{I} = [bins{I}, value];
        %Compute distortion for mth iteration
        curr_distor = (value - codepoints).^2;
        mth_distor = [mth_distor, min(curr_distor)];
    end
    for j=1:N
        j_bin = bins{j};
        codepoints(j) = mean(j_bin)
    end
    %Distortion for new codepoints
    for k=1:5000
        value = samples(k);
        %new distortion values
        m_pls_1_distor = [m_pls_1_distor, min((value - codepoints).^2)];
    end
    D_m = mean(mth_distor);
    D_m_new = mean(m_pls_1_distor);
    D_rate = (D_m - D_m_new)/D_m;
    if D_rate > 0.001
        code_pts = find_quantization_points(samples, N, codepoints);
    else
        code_pts = codepoints;
    end
end    