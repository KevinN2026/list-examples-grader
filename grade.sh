CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
    then
        echo "File exists!"
    else 
        echo "File doesn't exist!"
        exit 1
fi

# cp ListExamples.java ListTests.java ~/OneDrive/Documents/GitHub/list-examples-grader/grading-area
cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area
 
cd grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > TestResults.txt

head -n 2 TestResult.txt > firstFile.txt
tail -n 1 firstFile.txt > secondFile.txt
PASS=`grep -c "." secondFile.txt`
FAIL=`grep -c "E" secondFile.txt`
TOTAL=$(($PASS + $FAIL))
echo "Your grade: " $PASS / $TOTAL


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
