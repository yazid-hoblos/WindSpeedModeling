model2 = lm(wv~I(rh^3)+I(rh^2)+rh,df)
summary(model2)
model2 = lm(wv~I(rh^2),df)
summary(model2)


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggplot(data=df, aes(x=rh,y=wv)) +
       geom_point() + 
       geom_smooth(method="lm", formula=y~I(x^3)+I(x^2)+x)

ggplot(data=df, aes(x=rh,y=wv)) +
       geom_point() + 
       geom_smooth(method="lm", formula=y~I(x^2))

## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggplot(data=df)+
  geom_point(mapping=aes(x=rh,y=wv))+
  geom_smooth(mapping=aes(x=rh,y=wv))


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
ggplot(data=df,mapping=aes(x=wv,fill=wv))+
  geom_boxplot()
ggplot(data=df,mapping=aes(x=rh,fill=rh))+
  geom_boxplot()