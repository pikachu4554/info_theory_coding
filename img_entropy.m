
image=imread('itc.jpeg');
%if(size(image,3)==3)
%    image=rgb2gray(image);
%end

image_vector = reshape(image, 1, []);
counts=hist(image_vector,0:255);
counts(counts==0)=[];
total=0;
for i=1:numel(counts)
    total=total+counts(i);
end
probabilities=counts/total;

entropy=0;
for i=1:numel(probabilities)
    entropy=entropy-probabilities(i)*log2(probabilities(i));
end

fprintf('Entropy of image is: %.6f',entropy);