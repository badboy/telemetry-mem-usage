#!/usr/bin/env ruby
# encoding: utf-8

# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

require 'json'

if ARGV.empty?
  puts "Usage: #{File.basename $0} <file>"
  exit 2
end

def add_subkey(data, subkey)
  data[subkey] ||= {}
  data[subkey]["_total"] ||= 0
  data[subkey]["_key"] ||= subkey
  data[subkey]
end

data = JSON.parse(ARGF.read)
data = data["reports"].select do |report|
  report["path"] =~ /explicit\/telemetry/
end

reports = {"_total" => 0}
data.each do |report|
  keys = report["path"].sub("explicit/", '').split("/")
  keys.unshift(report["process"])

  data = reports
  reports["_total"] += report["amount"]
  keys.each_with_index do |key, i|
    data = add_subkey(data, key)
    before = data['_total']
    data['_total'] += report["amount"]
  end
end

def print_tree(reports, maxtotal=nil, indent=0)
  reports.each do |key, data|
    if ["_total", "_key"].include?(key)
      next
    end

    if indent==0
      maxtotal = data['_total']
    end

    print ' '*indent
    perc = data['_total'] / maxtotal.to_f * 100
    key = key.gsub(/ \(.+\)/, '')
    puts "%s: %d (%.2f%%)" % [key, data['_total'], perc]
    print_tree(data, maxtotal, indent+2)
    if indent == 0
      puts
    end
  end
end

print_tree(reports)
