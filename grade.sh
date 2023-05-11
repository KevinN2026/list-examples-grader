CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[-e ./list-examples-grader/student-submission ]]
    then
        echo "File exists!"
        exit 1
    else 
        echo "File doesn't exist!"
fi

cp ListExamples.java ListTests.java ~/OneDrive/Documents/GitHub/list-examples-grader/grading-area

javac ListExamples.java ListTests.java
java ListTests



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
