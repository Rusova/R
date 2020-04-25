install.packages('devtools')
library('devtools')
devtools::install_github("rstudio/tensorflow")
devtools::install_github("rstudio/keras")

library('keras')
library('tensorflow')
install_keras()
#��������� � ������ ���������


install_tensorflow(version = '1.12')
#����� ������ ��-�� ������


mnist <- dataset_mnist()
#��������� ����


train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y
#���������� ���� �� 4 �����


network <- keras_model_sequential() %>%
layer_dense(units = 512, activation = 'relu', input_shape = c(28*28)) %>%
layer_dense(units = 10, activation = 'softmax')
#���������� ����������� ���������� ����


network %>% compile(optimizer = 'rmsprop', loss = 'categorical_crossentropy',metrics = c('accuracy'))
#+�����������, ������� ������ � �������� � �������� �������


train_images <- array_reshape(train_images, c(60000, 28*28))
train_images <- train_images/255
str(train_images)
#��������� ����������� � ������� ��������

test_images <- array_reshape(test_images, c(10000, 28*28))
test_images <- test_images/255
#���������� � �������� �����

train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)
#�������� ��������� ��� �������


network %>% fit(train_images, train_labels, epochs = 20, batch_size = 128)
#���������� ��������� ���� (� ���������� �������� ���� 95%)


metric <- network %>% evaluate(test_images, test_labels)
metric
#�� �������� ������� �������� ��� �� ��������� 95%


opening <- network %>% predict_classes(test_images[1:10,])
test_labels1 <- mnist$test$y
test_labels1[1:10]

closing <- network %>% predict_classes(test_images[9991:10000,])
test_labels1 <- mnist$test$y
test_labels1[9991:10000]
our10 <- rbind(test_labels1[1:10], test_labels1[9991:10000] )
#������������ �������� � �� ��������� � �������� (� ������ ������ �������� � ������������� �������� �������)


history <- network %>% fit(train_images, train_labels,epochs = 5, batch_size = 128,validation_split = 0.2)
plot(history)
#�������� � ���������� +������������� � �������� �������


a <- mnist$test$x[7, 1:28, 1:28]
a
image(as.matrix(a))
#����������� 7 ����� �� ��������� �������


test_a <- array_reshape(a, c(1, 28*28))
test_a
dim(test_a)
test_a <- test_a/255
network %>% predict_classes(test_a)
#������������ �����


par(mfrow = c(2, 2))
#������� ����

a1 <- mnist$test$x[9991, 1:28, 1:28]
image(as.matrix(a1))

a2 <- mnist$test$x[9992, 1:28, 1:28]
image(as.matrix(a2))

a3 <- mnist$test$x[9993, 1:28, 1:28]
image(as.matrix(a3))

a4 <- mnist$test$x[9994, 1:28, 1:28]
image(as.matrix(a4))

a5 <- mnist$test$x[9995, 1:28, 1:28]
image(as.matrix(a5))

a6 <- mnist$test$x[9996, 1:28, 1:28]
image(as.matrix(a6))

a7 <- mnist$test$x[9997, 1:28, 1:28]
image(as.matrix(a7))

a8 <- mnist$test$x[9998, 1:28, 1:28]
image(as.matrix(a8))

a9 <- mnist$test$x[9999, 1:28, 1:28]
image(as.matrix(a9))

a10 <- mnist$test$x[10000, 1:28, 1:28]
image(as.matrix(a10))  
#10 ����������� ��������� ������
