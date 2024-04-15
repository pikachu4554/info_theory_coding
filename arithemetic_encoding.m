probabs=[0,0.3,0.25,0.2,0.15,0.1];
alphas=['s','a','r','m','i'];
cum_probs=cumsum(probabs);
lower_limit=0;
upper_limit=1;
range=upper_limit-lower_limit;
str='sriam';
for i=1:(numel(str)-2)
    location=find(alphas==str(i));
    lower_limit=cum_probs(location);
    upper_limit=cum_probs(location+1);
    range=upper_limit-lower_limit;
    cum_probs(1)=lower_limit;
    cum_probs(numel(str)+1)=upper_limit;
    for j=2:numel(str)
        cum_probs(j)=cum_probs(j-1)+range*probabs(find(str==str(j)));
    end
end
location=find(alphas==str(numel(str)));
lower_limit=cum_probs(location);
upper_limit=cum_probs(location+1);
tag=(upper_limit+lower_limit)/2;
fprintf('tag is: %.6f',tag);
