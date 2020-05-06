question_10 <- function(){

    # install the ISLR package
    install.packages("ISLR")

    # load the ISLR library
    library(ISLR)

    # attach the Weekly dataset
    attach(Weekly)

    # produce summaries
    summary(Weekly)

    # plots every coloumn with each other
    pairs(Weekly)

    # fit a logistic regression model predicting Direction with Lag1, ... , Lag5, and Volume are predictors
    glm.fits=glm(Direction∼Lag1+Lag2+Lag3+Lag4+Lag5+Volume ,
    data=Weekly ,family=binomial )

    summary(glm.fits)

    "The significance of the predictors can be measured by their p-values in the z-distribution. 
    Lag2 has the strongest relationship, with a p-value of 0.02."

    # display the dummy variable coding of Direction
    contrasts (Direction )

    # init the table of predicted values to Down
    glm.pred=rep("Down",1089)

    # find the probability of Direction being up
    glm.probs=predict(glm.fits, type="response")

    # if the probability of a row being up is greater than the threshold of 0.5, label it as up
    glm.pred[glm.probs >.5]=" Up"

    # confusion matrix to see the error rate of the classification
    table(glm.pred, Direction)

    "
            Direction
    glm.pred Down  Up
        Up   430 557
        Down   54  48

    (557 + 54)/ 1089 = 0.5610652
    56% of observations were classified correctly.

    430 / (557 + 430)
    There are many false positives, 43% of the positive classifications were wrong.

    48 / (54 + 48)
    There are also many false negative, 47% of the negative classifications were wrong.
    
    "

    # create a boolean vector for the training dataset
    train=(Year < 2008)

    # subset of the data that will be used for testing
    Weekly.test = Weekly[!train,]

    # response value of the test data
    Direction.test = Direction[!train]

    # fit a logistic regression model to the trianing data
    logistic.fit = glm(Direction∼Lag2, data=Weekly ,family=binomial, subset=train )

    # use the model to predict the response of the test data
    logistic.probs = predict(logistic.fit , Weekly.test , type="response")

    # find the dimensions of the test data
    dim(Weekly.test)

    # init the table of predicted values to Down
    logistic.pred = rep("Down", 156)

    # set prediction to up if the predicted probability is greater than 0.5
    logistic.pred[logistic.probs>0.5] = "Up"

    # create a confusion matrix
    table(logistic.pred, Direction.test )

    # Compute the accuracy of the model on the test data
    mean(logistic.pred == Direction.test)

    "The logisitic model correctly classified 55% of the cases."

    # Needed for classification functions
    library(MASS)

    # fit a Linear Discriminant Analysis model
    lda.fit = lda(Direction~Lag2, data=Weekly, subset=train)

    # use the model to predict the test data
    lda.pred=predict(lda.fit , Weekly.test)

    # the observations that lda classified to
    lda.class=lda.pred$class

    # create a confusion matrix
    table(lda.class, Direction.test)

    # find the accuracy of the model
    mean(lda.class==Direction.test)

    "The linear discriminant model correctly classified 54% of the cases."

    # fit a Quadratic Discriminant Analysis model
    qda.fit = qda(Direction~Lag2, data=Weekly, subset=train)

    # use the model to predict the test data
    qda.pred=predict(qda.fit , Weekly.test)

    # the observations that lda classified to
    qda.class=qda.pred$class

    # create a confusion matrix
    table(qda.class, Direction.test)

    # find the accuracy of the model
    mean(qda.class==Direction.test)

    "The quadratic discriminant model correctly classified 54% of the cases."

    # required of KNN classification
    library(class)

    # training set of Lag2 values
    train.X = (Lag2)[train]

    # test set of Lag2 values
    test.X = (Lag2)[!train]

    # training responses for knn
    Direction.train =Direction[train]

    # set the starting point to the randomization so the results are reproducible
    set.seed(1)

    # create a knn model with the training data, have to explicitly convert the vector of Lag1 into a matrix
    knn.pred = knn(data.frame(train.X), data.frame(test.X), Direction.train, k=1)

    # confusion matrix for knn
    table(knn.pred , Direction.test )

    # calculate the accuracy of the knn model
    mean(knn.pred==Direction.test)

    "The K nearest neighbour model correctly classified 50% of the cases."

    "
    Since the observations of stock data is difficult to predict, all the model performed poorly. The logistic model performed the best.
    "

}

question_11 <- function(){

    library(ISLR)

    attach(Auto)

    # init the mpg01 vector to 0
    mpg01=rep(0,392)

    # find the median of mpg
    med = median(Auto$mpg)

    # set the mpg01 index to 1 if it is greater than the median
    mpg01[Auto$mpg > med]= 1

    # add the mpg01 column to the dataframe
    Auto <- data.frame( mpg01, Auto)

    # find the columns that are closely associated to mpg01
    pairs(Auto)

    # the correlation between columns
    cor(Auto[, -9])

    "Horsepower, weight, displacement, and cylinders seem to be closely related to mpg01."

    # the training set will have even indicies
    train<-seq(2,392,2)

    # the test set will have negative indicies
    test<-seq(1,391,2)

    # subset of the Auto used for testing
    Auto.test <- Auto[test,]

    # test observations
    mpg01.test <- mpg01[test]

    # training observations
    mpg01.train <- mpg01[train]

    # Needed for classification functions
    library(MASS)

    # fit a linear discriminant analysis model to the even number dataset
    lda.fit = lda(mpg01~ horsepower + weight + displacement + cylinders
        , data=Auto, subset=train)

    # use the model to predict the test data
    lda.pred=predict(lda.fit , Auto.test)

    # classes that lda classified the observations to
    lda.class=lda.pred$class

    # create a confusion matrix
    table(lda.class, mpg01.test)

    # find the accuracy of the model
    mean(lda.class==mpg01.test)

    "The linear discriminant model correctly classified 88% of the cases, with a test error of 12%"

    # fit a quadratic discriminant analysis model to the even number dataset
    qda.fit = qda(mpg01~ horsepower + weight + displacement + cylinders
        , data=Auto, subset=train)

    # use the model to predict the test data
    qda.pred=predict(qda.fit , Auto.test)

    # classes that qda classified the observations to
    qda.class=qda.pred$class

    # create a confusion matrix
    table(qda.class, mpg01.test)

    # find the accuracy of the model
    mean(qda.class==mpg01.test)

    "The quadratic discriminant model correctly classified 90% of the cases, with a test error of 10%"

    # fit a logistic regression model to the trianing data
    logistic.fit = glm(mpg01~ horsepower + weight + displacement + cylinders
        , data=Auto, subset=train)

    # use the model to predict the response of the test data
    logistic.probs = predict(logistic.fit , Auto.test , type="response")

    # find the dimensions of the test data
    dim(Auto.test)

    # init the table of predicted values to Down
    logistic.pred = rep(0, 196)

    # set prediction to 1 if the predicted probability is greater than 0.5
    logistic.pred[logistic.probs>0.5] = 1

    # create a confusion matrix
    table(logistic.pred, mpg01.test )

    # Compute the accuracy of the model on the test data
    mean(logistic.pred == mpg01.test)

    "The logisitic model correctly classified 88% of the cases, with an error rate of 12%."

    # required of KNN classification
    library(class)

    # observations used by knn to find closest neighbours
    train.X = cbind(horsepower, weight, displacement, cylinders)[train,]

    # test observations
    test.X = cbind(horsepower, weight, displacement, cylinders)[test,]

    # set the starting point to the randomization so the results are reproducible
    set.seed(1)

    # create a knn model with the training data
    knn.pred = knn(train.X, test.X, mpg01.train, k=1)

    # confusion matrix for knn
    table(knn.pred , mpg01.test )

    # calculate the accuracy of the knn model
    mean(knn.pred==mpg01.test)

    "The knn model correctly classified 84% of the cases, with an error rate of 16%."

    # create a knn model with a k of 2
    knn2.pred = knn(train.X, test.X, mpg01.train, k=2)

    # calculate the accuracy of the knn model with k=2
    mean(knn2.pred==mpg01.test)

    # create a knn model with a k of 3
    knn3.pred = knn(train.X, test.X, mpg01.train, k=3)

    # calculate the accuracy of the knn model with k=3
    mean(knn3.pred==mpg01.test)


}