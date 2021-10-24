# frozen_string_literal: true

require 'json'
require 'net/http'

# Connects to API with astronaut data, then parses the JSON to organize
# the strings within into a table.
class ApiParser
  # Establish connection to desired API
  def connect_to_api
    url = 'http://api.open-notify.org/astros.json'
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  # Once connected to API, parse its JSON.
  def parse_api_data
    JSON.parse(connect_to_api)
  end

  # States the present number of people in space.
  def people_count
    count = parse_api_data.values[0]
    puts "There are #{count} people in space right now. \n \n"
  end

  # The capitalized headers for the top of the table;
  # width of the header is as long as the longest value in the column.
  def headers
    people = parse_api_data.values[1]
    headers = people.first.keys
    name = headers[1]
    craft = headers[0]
    name_space = " " * (find_longest('name') - name.length)
    craft_space = " " * (find_longest('craft') - craft.length)
    puts "#{name.capitalize + name_space}|#{craft.capitalize + craft_space}"
  end

  # The divider between the headers and the people data
  def divider
    puts "#{'-' * find_longest('name')}|#{'-' * find_longest('craft')}"
  end

  # Iterate through all the people and return the character count
  # of the longest string for the supplied string type.
  def find_longest(string)
    return nil unless string == 'name' || string == 'craft'

    people = parse_api_data.values[1]
    accumulator = []
    people.each do |person|
      accumulator << person[string].length
    end
    accumulator.sort_by(&:size).max
  end

  # Provides the name of each person and the craft they are on;
  # column width is dependent on ther longest item in the column.
  # TODO: Don't repeat the name of the craft--group all people by craft.
  def people_data
    people = parse_api_data.values[1]
    people.each do |person|
      name_space = " " * (find_longest('name') - person['name'].length)
      craft_space = " " * (find_longest('craft') - person['craft'].length)
      puts "#{person['name'] + name_space}|#{person['craft'] + craft_space}"
    end
  end

  # Bringing all the above methods together to return the desired table.
  def display
    headers
    divider
    people_data
  end
end
