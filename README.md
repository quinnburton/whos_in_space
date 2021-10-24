# Who's in Space?

Did you know you can find out exactly who’s in space right
now? The Open Notify API provides that information. Visit
http://api.open-notify.org/astros.json to see not only how many
people are currently in space but also their names and which
spacecraft they’re on.

Create a program that pulls in this data and displays the
information from this API in a tabular format.

## How to Use

1. In the terminal, open up `irb` or `pry` in the repo's directory.
2. Type `load './api_parser.rb'`
3. Type `ApiParser.new.display` to return a table that looks similar to the example below.

## Example Output

```
There are 3 people in space right now:

Name                | Craft
--------------------|------
Gennady Padalka     | ISS
Mikhail Kornienko   | ISS
Scott Kelly         | ISS
```

## Constraints

- Read the data directly from the API and parse the results
each time the program is run. Don’t download the data as text and read it in.
- Solve the problem using object-oriented programming. You should have at least one class.
- Add unit tests if possible. At a minimum, write testable code.

## Challenges

- Ensure that the width of the header is as long as the
longest value in the column.
- Don’t repeat the name of the craft—group all people by
craft.

## Do Not Do This Challenge

- Can you reliably sort the results alphabetically by last
name? Be careful—some people have spaces in their
name, like “Mary Sue Van Pelt.”
