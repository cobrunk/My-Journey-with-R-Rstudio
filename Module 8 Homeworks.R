library(ggplot2)

#rm(list=ls())

#8.1
mpg_df=data.frame(mpg)
head(mpg_df)

#cyl & cty
ggplot(mpg_df,aes(y=cty,x=cyl,color=cyl))+
  geom_point()
summary(lm(data = mpg_df, cty~cyl))

#displ and cty
ggplot(mpg_df,aes(y=cty,x=displ,color=displ))+
  geom_point()
summary(lm(data = mpg_df, cty~displ))

#cyl and hwy
ggplot(mpg_df,aes(y=hwy,x=cyl,color=cyl))+
  geom_point()
summary(lm(data = mpg_df, hwy~cyl))

#disp and hwy
ggplot(mpg_df,aes(y=hwy,x=displ,color=displ))+
  geom_point()
summary(lm(data = mpg_df, hwy~displ))

#8.2

#year and cty
ggplot(mpg_df,aes(y=cty,x=as.factor(year),
                  fill=as.factor(year)))+
  geom_boxplot()
summary(lm(data = mpg_df, cty~as.factor(year)))

#class and cty
ggplot(mpg_df,aes(y=cty,x=class,
                  fill=class))+
  geom_boxplot()
summary(lm(data = mpg_df, cty~as.factor(class)))

#trans and cty
ggplot(mpg_df,aes(y=cty,x=trans,
                  fill=trans))+
  geom_boxplot()
summary(lm(data = mpg_df, cty~as.factor(trans)))

#fl and cty
ggplot(mpg_df,aes(y=cty,x=fl,
                  fill=fl))+
  geom_boxplot()
summary(lm(data = mpg_df, cty~as.factor(fl)))

#manufacturer and cty
ggplot(mpg_df,aes(y=cty,x=manufacturer,
                  fill=manufacturer))+
  geom_boxplot()
summary(lm(data = mpg_df, cty~as.factor(manufacturer)))
