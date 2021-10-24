# frozen_string_literal: true

require 'json'
require 'net/http'

# load './api_parser.rb'
# ApiParser.new.connect_to_api
class ApiParser
  def connect_to_api
    url = 'http://api.open-notify.org/astros.json'
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  def parse_api_data
    JSON.parse(connect_to_api)
  end

  # States the current number of people in space
  def people_count
    count = parse_api_data.values[0]
    puts "There are #{count} people in space right now. \n \n"
  end

  # The headers for the top of the table
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

  # Iterate through all the people and return the
  # character count of the longest string for the
  # supplied string type
  def find_longest(string)
    return nil unless string == 'name' || string == 'craft'

    people = parse_api_data.values[1]
    accumulator = []
    people.each do |person|
      accumulator << person[string].length
    end
    accumulator.sort_by(&:size).max
  end

  # Provides the name of each person and the craft they are on
  def people_data
    people = parse_api_data.values[1]
    people.each do |person|
      name_space = " " * (find_longest('name') - person['name'].length)
      craft_space = " " * (find_longest('craft') - person['craft'].length)
      puts "#{person['name'] + name_space}|#{person['craft'] + craft_space}"
    end
  end

  # Broken into two columns: `Name` and `Craft`
  # Ensure that the width of the header is as long as the longest value in the column.
  # Don't repeat the name of the craft-—group all people by craft.
  def display
    headers
    divider
    people_data
  end
end
