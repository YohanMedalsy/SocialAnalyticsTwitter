# Map 1-based optional input ports to variables
dataset1 <- maml.mapInputPort(1) # class: data.frame

library('Hmisc')

#df=dataset1[,c('affect', 'cause')]
df=dataset1
df1=as.matrix(df)
print(nrow(df1))

df1.cor=rcorr(df1)
#print(nrow(df1.cor))
#print(df1.cor)
#print(df1.cor$P)

df1.cor.r=as.data.frame(df1.cor$r)
df1.cor.p=as.data.frame(df1.cor$P)

#print(head(df1.cor.r))
#print(head(df1.cor.p))

print(df1.cor.r)
print("========")
print(df1.cor.p)
print("++++++++")

#df1.cor.r.p=cbind(df1.cor.r,df1.cor.p )

# Select data.frame to be sent to the output Dataset port
maml.mapOutputPort("df");
