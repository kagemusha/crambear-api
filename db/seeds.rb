RUBY_CARDS = [
    ["What's an easier way to write \#{@me}?", "\#@me"],
    ["What's the difference between Proc and lambdas","1. lambdas check arg count, procs set extras to nil 2. Proc returns from method w return val, lambdas return val and let method continue"],
    ["what is $* a synonym for?","ARGV"],
    ["What's the difference between ActiveRecord's all and find_each methods?",
      "SomeModel.all will fetch the whole table, whereas SomeModel.find_each will batch the fetch (default is 1000 records) "],
    ["What ActiveRecord method allows you to load associations eagerly?", "includes e.g. Order.includes(:line_items)"],
    ["What package does Rails provide to help with background processing?", "Active Job"],
    ["How would you validate that a model attribute is greater then a lower_limit?", "validates :some_attr, numericality: { greater_than: lower_limit }"],
    ["What Rails task will list routes for you?","rake routes"],
    ["How do you reload a Rails assocition (instead of relying on the default cached values)?","someObj.associationObjects(true)"],
    ["What's difference between calling destroy and delete on a model?","destroy runs the model's callbacks and validations, whereas delete doesn't"],
    ["How do you whitelist params that can be used to update your models?","strong params, e.g. params.require(:user).permit(:name, :age, :email)"],
]
EMBER_CARDS = [
    ["What are the Ember MVC building blocks?","routes, controllers, templates and components"],
    ["How do you go to another route from within a route?","this.transitionTo('someOtherRoute') //'this' refers to the route"],
    ["How would you make a computed property dependent on the 'count' attribute on an array pointed to by property 'items?'","Ember.computed('items.@each.count', ...)"],
    ["What Ember function returns true is its argument is null, undefined, or an empty string or array?","Ember.isBlank(obj)"],
    ["What Ember 2.1 HTMLBars helper allows you to reference a dynamic property?","{{get someObjec aDynamicProperty}}"],
    ["What Ember 2.1 HTMLBars helper allows you to iterate over a set of properties?","{{#each-in obj as |key value|}}"],
    ["Which of the following have been removed from Ember 2.0: {{view}}, array controllers, services, {{#each item in items}}?","All except for services"],
    ["What Ember function returns the opposite of Ember's isBlank function?","Ember.isPresent(obj)"],
    ["How do you go to another route from within a controller?","this.transitionToRoute('someRoute') //'this' refers to the controller"],
    ["How do you set a component's enclosing tag?","tagName property"],
    ["What's the new preferred way to write Ember.computed(someFunction).property('propA','propB')?", "Ember.computed('propA','propB', someFunction)"],
    ["What is Ember.$?", "An alias for jQuery: Ember.$ = jQuery;"],
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
