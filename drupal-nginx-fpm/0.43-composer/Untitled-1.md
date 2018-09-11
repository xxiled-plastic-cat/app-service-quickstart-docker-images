Hi, Jack,

	So glad to see you are using this image.

- I just pushed appsvcorg/drupal-nginx-fpm:0.43, maybe you can have a try, and any comments are welcome.

    - Fixed issue of composer and drush, could you please provide a simple scenario if you think it still doesn't fit expectation.
    - Install local redis-server and php extension redis. I am still trying to take advantage of it, and thinking about how to prove it.

-  About question of repo, is has been mentioned in readme.md.

    - By default, it's https://github.com/azureappserviceoss/drupalcms-azure, branch is linuxappservice.
    - Please feel free clone it and modify as your wish, and set GIT_REPO and GIT_BRANCH in Application setting of Web app on azure. Then it will pull your private drupal core codes into /home/site/wwwroot. (By this way, you also can back up your changes with "git push".)

- This image is being optimized, any advice is welcome, totally open for them.

I read your doc, it’s great. Below az cli script is being used to deploy docker image to azure web app.

```
$resourceGroupName = “rglz-test”
$planName = $resourceGroupName
$appName = $planName
$containerName = "appsvcorg/drupal-nginx-fpm:0.43"
$location = "West US"

az group create -l $location -n $resourceGroupName

az appservice plan create `
    -n $planName `
    -g $resourceGroupName `
    --sku S3 --is-linux 

az webapp create `
    --resource-group $resourceGroupName `
    --plan $planName `
    --name $appName `
    --deployment-container-image-name $containerName

az webapp config appsettings set `
    --resource-group $resourceGroupName `
    --name $appName `
    --settings WEBSITES_ENABLE_APP_SERVICE_STORAGE="true"

az webapp config appsettings set `
    --resource-group $resourceGroupName `
    --name $appName `
    --settings WEBSITES_CONTAINER_START_TIME_LIMIT="600"

# please modify DB settings according to current condition
az webapp config appsettings set `
        --resource-group $resourceGroupName `
        --name $appName `
        --settings DATABASE_HOST="rglz-mysql-westus-1.mysql.database.azure.com" `
            DATABASE_NAME="drupal043" `
            DATABASE_USERNAME="sumuth@rglz-mysql-westus-1" `
            DATABASE_PASSWORD="fasdfasdfasdfaseqwrt"
```

    

Thanks,
-Leon
