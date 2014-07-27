RUBY_CARDS = [
    ["What's an easier way to write \#{@me}?", "\#@me"],
    ["What's the difference between Proc and lambdas","1. lambdas check arg count, procs set extras to nil 2. Proc returns from method w return val, lambdas return val and let method continue"],
    ["what is $* a synonym for?","ARGV"]
]
EMBER_CARDS = [
    ["What are the Ember MVC building blocks?","routes, controllers, templates and components"],
    ["What is Ember's test data store adapter?","adapter: 'DS.FixtureAdapter'"],
    ["What controller property allows it to access another controller?", "needs\n\nApp.NeedyController = Em.Controller.extend\n  needs: ['neededController']"],
    ["What setting allows you to output route transitions", "LOG_TRANSITIONS\n\nApp = Ember.Application.create({LOG_TRANSITIONS: true});"],
    ["How do you make a controller attribute depend on other things", "With the property method e.g. attribute: (someFunction).property('iDependOnThisProp', 'andThisProp')"],
    ["What is Ember.K?", "An empty function: Ember.K = function() { return this; }; "],
    ["What is Ember.$?", "An alias for jQuery: Ember.$ = jQuery;"],
    ["How do you pass content to a view?", "Generally in a template. For example\n\nApp.MyView contentBinding='items'\n\nwhere items is defined on your controller"],
    ["How do you get the HTMLElement that a view encapsulates?", "view.get('element')"],
]


def create_set(name, cards)
  set = CardSet.new(name: name)
  cards.each do |card|
    set.cards << Card.new(front: card[0], back: card[1])
  end
  set.public = true
  set.save!
  set.cards.each do |card|
    card.save!
  end
  set
end

CardSet.destroy_all
create_set("Ember", EMBER_CARDS)
create_set("Ruby", RUBY_CARDS)

if Rails.env == "development"
  test_email = "t@t.com"
  if not User.find_by_email(test_email)
    user = User.create! :name => "Tester", :email => test_email, :password => "tester", :password_confirmation =>"tester"
  end
end
