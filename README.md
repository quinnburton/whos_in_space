# Who's in Space?

Did you know you can find out exactly who’s in space right
now? The Open Notify API provides that information. Visit
http://api.open-notify.org/astros.json to see not only how many
people are currently in space but also their names and which
spacecraft they’re on.

Create a program that pulls in this data and displays the
information from this API in a tabular format.

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
each time the program is run. Don’t download the data
as text and read it in.
- Write at least *some* tests, but leave some for pairing session.

## Challenges

- Ensure that the width of the header is as long as the
longest value in the column.
- Don’t repeat the name of the craft—group all people by
craft.
- Can you reliably sort the results alphabetically by last
name? Be careful—some people have spaces in their
name, like “Mary Sue Van Pelt.”
