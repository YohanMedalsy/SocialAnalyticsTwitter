# Map 1-based optional input ports to variables
dataset1 <- maml.mapInputPort(1) # class: data.frame

library("MASS")

df=dataset1
df.fit=glm.nb(retweets~hashtags+followercount+infection+cause+study+news+organization+protect+posemo+negemo , data=df)
summary(df.fit)
df.fit.coefdf=as.data.frame.matrix(summary(df.fit)$coefficients)
s=summary(df.fit)$aliased
df.fit.coefdf1=data.frame(Reduce(rbind, s))

l=c(all.vars(formula(df.fit)))
df.fit.coefdf1$l=l

df.fit.coefdf2=df.fit.coefdf1[which(df.fit.coefdf1==FALSE),]
df.fit.coefdf$nm=df.fit.coefdf2$l
names(df.fit.coefdf)=c('estimate', 'stderror', 'zvalue', 'pvalue')

df.fit.coefdf3=df.fit.coefdf[which(df.fit.coefdf$pvalue<0.05),]
df.fit.coefdf3=df.fit.coefdf3[order(-df.fit.coefdf3$estimate),]
names(df.fit.coefdf3)=c('estimate', 'stderror', 'zvalue', 'pvalue', 'colname')
print(df.fit.coefdf3)

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("df.fit.coefdf3");
