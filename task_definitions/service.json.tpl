{
    "containerDefinitions": 
    [ 
      {
         "name": "spring1",
         "image": "${ecr_url}",
         "cpu": "1024",
         "memory": "2048",
         "essential": "true",
         "portMappings": "8081",
         "environment": ["${spring_profiles_active}"],
         "spring.profiles.active": "dev"
       }  
    ]
}
