# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
AJAX: make request without page loading:
Add remote= true in form or Anchor tag:
<%= form_for([@blog, @blog.comments.build], :remote => true) do |f| %>
 
    <%= f.label :body %><br>
    <%= f.text_area :body %>
  
    <%= f.submit %>
<% end %>

<a herf=”url” data-remote=true> Hello </a>
<%= link_to “hello”, root_url, :remote => true %>

In Controller: request will be come in AS JS format
def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    render 'blogs/create_comments'
  end





In Views:

app/blogs/create_comments.js.erb
$('.comments-container').html('<%= escape_javascript( render "comments/comments")%>')
$("#new_comment")[0].reset();
$("#new_comment").hide();


In App/views/comments/_comments.html.erb:

<%@blog.comments.each do |comment|%> 
<p>
  <strong>Commenter:</strong>
  <%= comment.commenter %>
</p>
 
<p>
  <strong>Comment:</strong>
  <%= comment.body %>
</p>
 
<p>
  <%= link_to 'Destroy Comment', [comment.blog, comment],
               method: :delete,
               data: { confirm: 'Are you sure?' } %>
</p>
<p>
  <%= link_to 'Edit Comment', edit_blog_comment_path(comment.blog, comment) %>
</p>

<h2> reply a comment</h2>
<% @replies=Reply.where(:comment_id=> comment.id)
%>

<%@replies.each do |reply|%>
  <p><strong>Reply:</strong>><%=reply.body%></p>
<%end%>


<%= render 'replies/form', :comment=>comment %>
<%end%>
