# Phase 5 React-Redux Backend Flow

## _USER_
### *Attributes*
  - Name 
  - Username
  - Password
### *Relationships*
  - has_many :recipes
  - has_many :categories, through: :recipes
  - has_many :comments
  - has_many :commented_recipes, through: :comments, source: :recipe
### *Validations*
  - validates :email, presence: true, uniqueness: true
-----------------------------------------------------

## _RECIPES_
### *Attributes*
  - Name
  - Ingredients
  - Instructions
  - Image_url
  - Category 
  - user_id
### *Relationships*
  - belongs_to :user 
  - belongs_to :category
  - has_many :comments
  - has_many :users, through: :comments 
### *Validations*  
  - validates :name, :instructions, :ingredients, presence: true
-----------------------------------------------------

## _COMMENTS_ 
### *Attributes*
  - Content
  - user_id
  - recipe_id
### *Relationships*
  - belongs_to :user
  - belongs_to :recipe 
### *Validations* 
  - validates :content, presence: true 
-----------------------------------------------------

## _CATEGORY_
### *Attributes*
  - name
### *Relationships*
  - has_many :recipes
  - has_many :users, through: :recipes