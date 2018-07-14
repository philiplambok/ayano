# Ayano Project 
Ayano is API platform for sharing links.

# Documentation 
## Aktor 
- User 
- Admin 

## Features 
Features that we handing 
- Authentication 
- Submit link 
- Update link
- Show link
- Delete link 
- Listing Links
- Profile User

## Enpoints 
### Authentication 
We using JWT JSON token for authentication. 

### Request
```
POST 
/api/auth
```

### Response 
```json
{
  "jwt": "your_token_here"
}
```

Then, using token for your request in *headers* following [ref](https://jwt.io/introduction/)
```
Authorization: Bearer <token>
```

## Submit Links
This feature for adding your link to database. 

### Request
```
POST
/api/blogs
```

### Response 
If your link is saved or success api will response your blog object.
```json
{
  "blog": {
    "title": "Beberapa tips menulis CSS yang baik", 
    "url": "your.link.blog.moe/1.html"
  }
}
```
if your link is not saved or having something expected errors. 
```json
{
  "error": {
    "code": 401,
    "message":  "You haven't authentication, please login before you request this"
  }
}
```

## Update Links
Updating your link. Just user actor can use this feature, admin actor can't. 

### Request 
```
PUT or PATCH 
/api/blogs/:id
```

### Response
If your blog has successfully updated, it will be response the updated blog object. 

```json
{
  "blog": {
    "title": "Pengantar CSS",
    "url": "your.link.blog.moe/2.html"
  }
}
```

If your request has expected error, it will response error message. 
```json
{
  "error":{
    "code": 404, 
    "message": "Your link not found, maybe it's been deleted"
  }
}
```

## Show Link 
I love API with simple response. 

### Request 
```
GET 
/api/blog/:id
```

### Response
If response is success. 

```json
{
  "blog": {
    "title": "Pengantar CSS", 
    "url": "your.link.blog.moe/2.html"
  }
}
```

If request has expected error. 
```json
{
  "error":{
    "code": 404, 
    "message": "Link not found"
  }
}
```

### Request 
```
GET 
/api/blog/:id/user 
```

### Response 
If response is success.
```json
{
  "user":{
    "username": "pquest"
  }
}
``` 

Pretty cute, right? 

## Delete Link 
User actor and admin actor can use this feature. 

### Request 
```
DELETE 
/api/blog/:id
```

If your link was deleted, it will be return deleted object.
```json
{
  "blog": {
    "title": "Pengantar CSS", 
    "url": "your.link.blog.moe/2.html"
  }
}
```

If your link wasn't deleted, it will be return error message. 
```json
{
  "error":{
    "code": 403, 
    "message": "Sorry, you haven't permission to do this."
  }
}
```

## Listing Links

### Request 
```
GET 
/api/blogs?page=1
```

### Response 
It will be return with pagination with *ten items* per page. 

```json
{
  "blogs":[
    {
      "blog": {
        "title": "Pengantar CSS", 
        "url": "your.link.blog.moe/2.html"
      }
    }, 
  ]
}
```

## Profile User

### Request 
```
GET 
/api/user/:id
``` 

### Response
Returning their information 
```json
{
  "user":{
    "username": "pquest"
  }
}
``` 

### Request 
```
GET 
/api/user/:id/blogs
```

### Response 
Returning their blogs
```json
{
  "blogs": [
    {
      "blog":{
        "title": "Pengantar CSS", 
        "url": "your.link.blog.moe/2.html"
      }
    }, 
  ]
}
```


# License 
Ayano project use MIT license. 

You will be free to download, reviews and also use the code for anyhing purposes. 
