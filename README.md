#Model Averaging 
Model averaging is an alternative approach for choosing one model over a group of all avaliable models. Instead of choosing specific variables to a model, we use all of them by averaging their coeffcients with weights $\omega_i$. Let $g_1, g_2, g_3, ... , g_n$ be all models made from all variables and let $\beta_{ij}$ be coefficient in $j$-th model from $i$-th variable. Coefficients are given by:
$$ \beta^{(i)} = \frac{\sum_{j=1}^{n} \beta_{ij} w_{j} F(g_{j})}{\sum_{j=1}^{n}w_{j}F(g_{j})},$$
  where $F(g_j)=1$ when coresponding variable $\beta_{ij}$ - the $i$-th variable in model $g_j$ - is in $j$-th model and $F(g_j)=0$ in other case. 
 Weights are calculated using Akaike Information Criterion. Lets calculate $\Delta_i$ as follows:
 $$\Delta_i = AIC_I - AIC_\min$$
 This is a difference between the best model (using AIC criterion) and $i$-th model. Weights are given by formula:
 $$w_{i}= \frac{\exp{(-\frac{1}{2}\Delta_{i}})}{\sum_{j=1}^{n} \exp{(-\frac{1}{2}\Delta_{j})}}$$
##Advantages and disadvantages 
Main advantage of model averaging is the fact that it use all the information given by all variables and with reasonable weight corresponding to each of them. On the other hand it maight be time consuming to calculate all the weight when the model is given with many predictors.

##References
1.  K. P. Burnham and D. R. Anderson “Model Selection and Multimodel Inference”