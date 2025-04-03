#4.1
x=10
y=12
if (x>y){
  print('1')}else{print('0')}

#4.2
Data=read.csv(file='C:/Users/cobbl/Desktop/Data Programing - UMSL/Data_with_column_names-1.csv')
floor=Data$Floor
area=Data$Area

for (i in floor) {
  i=i+1
  print(i)}

for (i in area) {
  if(i>800){
    i=i+1
  }else{i=i-1}
  print(i)}

#this doesn't work
write.csv(Data,"changed_data_M4.csv")

#4.3
library(imager)

image=load.image(file='C:/Users/cobbl/Desktop/Data Programing - UMSL/DataProgrammingImage-2.jpg')
plot(as.cimg(image))
dim(image)

#left border
plot(as.cimg(image[0:100,0:524,1,1:3]))
image[0:100,0:524,1,1:3]=0
plot(as.cimg(image[0:100,0:524,1,1:3]))
plot(as.cimg(image))

#right border
plot(as.cimg(image[1100:1200,0:524,1,1:3]))
image[1100:1200,0:524,1,1:3]=0
plot(as.cimg(image[1100:1200,0:524,1,1:3]))
plot(as.cimg(image))

#top border
plot(as.cimg(image[0:1200,0:100,1,1:3]))
image[0:1200,0:100,1,1:3]=0
plot(as.cimg(image[0:1200,0:100,1,1:3]))
plot(as.cimg(image))

#bottom border
plot(as.cimg(image[0:1200,424:524,1,1:3]))
image[0:1200,424:524,1,1:3]=0
plot(as.cimg(image[0:1200,424:524,1,1:3]))
plot(as.cimg(image))
