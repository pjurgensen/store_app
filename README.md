#Store
##Epicodus - Ruby on Rails project.

###Patti Jurgensen and Maigen Skjelstad

-- Work in progress -- UI is styled and user has the ability to upload an avatar --

Let's make a website for a store.

* [completed] As a store owner, I want to create a new entry for a product with a name, price, and description.

* As a shopper, I want to see a list of all the products in the store, and be able to click on them to get more information.

* As a store owner, I want to make sure only I and other store employees can add, edit, and remove products. Hint: Add user authentication. Instead of letting people sign up for the site, "seed" the site with one login you create from the Rails console. Allow that user to CRUD/L additional users. Only allow unauthenticated users to list and show products; all other actions for products and all actions for users should be restricted to authenticated users.

* As a store owner, I want to add product in bulk by uploading a CSV with information on them. Hint: Add a ProductUploadsController with only new and create actions. When you upload a CSV and the create action is run, it should look something like this:

product_uploads_controller.rb
class ProductUploadsController < ApplicationController
  def create
    ProductUpload.new(params[:product_upload][:csv]).parse!
  end
end

* In your model, use the smarter_csv gem to parse the CSV file:

product_upload.rb
class ProductUpload
  def initialize(file)
    @file = file
  end

  def parse!
    products_attributes = SmarterCSV.process(@file)
    products_attributes.each do |product_attributes|
      Product.create(product_attributes)
    end
  end
end

* This code is untested and may only approximate what is really needed to make it work :) Also, it is written assuming that the column headers of the CSV have the same name as the database column names for products.

* Notice that the model doesn't inherit from Active Record - it's a plain old Ruby object, or PORO. It's really important that you get comfortable mixing POROs in with your Active Record models. In small apps, you'll probably have more Active Record models than POROs, but especially as you work on bigger projects, POROs are really important so that your models don't get huge and overwhelming. One rule of thumb is that if you're trying to do something that would require a non-RESTful controller action, you should probably make a new controller backed with a PORO. Another rule of thumb is that if you have any logic in a controller that doesn't have to do with parsing a web request and doesn't belong in an existing model, put it in a PORO. Finally, if you have a class that's over 100 lines long, it's a good sign that it should be split into two or more classes, one of which is likely a PORO.

* As a store owner, I want to optionally add an image to a product.
* As a store owner, after I upload a CSV, I want to see a list of any rows that couldn't be imported.
* As a store owner, when I upload a CSV, I want to map the column headers of my CSV to the database fields, so that I don't have to make sure my column headers match the database field names exactly. Hint: Use the jQuery CSV plugin to parse the CSV, extract the headers, display them to the user, let them map to the database fields, and then send the mapping back as a parameter with the file upload.
