require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  # the Actor class, #full_name, that returns the first and last name of an actor.
  # Write a method in the Actor class, #list_roles, that lists all of the characters that actor has.
  # Write a migration that adds the column catchphrase to your character model.
  # Define a method in the Character class, #say_that_thing_you_say, using a given character's catchphrase.

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    #self
    # ["Khaleesi - Game of Thrones"]
    instance = Character.all.select {|char| char.actor_id == self.id}
    name_show = instance.map do |inst|
      "#{inst.name} - #{Show.find(inst.show_id).name}"
    end

  end


end
