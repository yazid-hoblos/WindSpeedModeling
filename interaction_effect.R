model11 = lm(wv~I(rh^2)*temperature+rh*pressure*Vpmax+wd,df)
summary(model11)


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
model11 = lm(wv~I(rh^2)*Vpmax*temperature*pressure*rho*wd,df)
summary(model11)


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
plot_data <- data.frame(Predicted_value = predict(model11),  
                       Observed_value = df$wv)
  
ggplot(plot_data, aes(x = Predicted_value, y = Observed_value)) +
                  geom_point()

plot_data <- data.frame(Predicted_value = predict(model1),  
                       Observed_value = df$wv)
  
ggplot(plot_data, aes(x = Predicted_value, y = Observed_value)) +
                  geom_point()


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
mean(summary(model1)$residuals^2)
mean(summary(model11)$residuals^2)


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
df$id = seq.int(nrow(df))
set.seed(111,sample.kind='Rejection')
train = df %>% slice_sample(prop=0.8)
nrow(train)
test=anti_join(df,train,by='id')
nrow(test)


## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
train = train[-16]
test = test[-16]

model11 = lm(wv~I(rh^2)*Vpmax*temperature*pressure*rho*wd,train)
model1 = lm(wv~rh,train)

pred1 = predict.lm(model11,test)
length(pred1)
pred2 = predict.lm(model1,test)



## ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
d = data.frame(pred1,actual=test$wv)
mean((d$actual-d$pred1)^2)
d = data.frame(pred2,actual=test$wv)
mean((d$actual-d$pred2)^2)
