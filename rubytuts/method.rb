class Post
  attr_reader :author, :title, :body, :comments

  def initialize options
    @author   = options[:author]
    @title    = options[:title]
    @body     = options[:body]
    @comments = options[:comments] || []
  end

  def insert_comment *comments
    # comment = Comment.new user: user, body: body
    # @comments << comment
    comments.each { |c| @comments << c }
  end

  def print_comments
    print "\n--- Comments---\n"
    @comments.each do |c|
      print "#{c.body}\n"
      print "by: #{c.user}\n\n"
    end
  end

end

class Comment
  attr_reader :user, :body

  def initialize options
    @user = options[:user]
    @body = options[:body]
  end

end


post = Post.new({
  author: 'José Rosado',
  title: 'This is my new post',
  body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quidem facere odio obcaecati eius sit illum provident, officia dolorem quo.'
})

post.insert_comment Comment.new({
    user: 'Brenda Taveras',
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, accusantium.'
  }),
  Comment.new({
    user: 'Emmanuel Rosado',
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, accusantium.'
  }),
  Comment.new({
    user: 'Saray Rosado',
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, accusantium.'
  }),
  Comment.new({
    user: 'Shara Taveras',
    body: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam, accusantium.'
  })

p post.inspect
print "==============================\n"
print "Title: #{post.title}\n"
print "Author: #{post.author}\n"
print "Body:" + post.body + "\n"
post.print_comments
print "==============================\n"


