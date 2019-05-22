islandSize = 33; //num block - 1
pixelArray[islandSize,islandSize] = 0; //array of heights per pixel
level = 0; //land height
levelSeed = 0; //used to generate level

for(i = 0; i < islandSize; i++)
{
    for(j = 0; j < islandSize; j++)
    {
        if(i > 0 && j > 0) 
        {
            if(pixelArray[i-1,j] >= 0 && pixelArray[i-1,j] < 7
            && pixelArray[i,j-1] >= 0 && pixelArray[i,j-1] < 7)
            {
                levelSeed = (pixelArray[i-1,j]+pixelArray[i,j-1])/2;
                level = int64(random_range(levelSeed,levelSeed+1));
            }else level = int64(random_range(0,7));
        }else level = int64(random_range(0,7));
        pixelArray[i,j] = level;
        block = instance_create((i-1)*32,(j-1)*32,islandObject);
        block.level = level;
    }
}

for(i = 0; i < islandSize; i++)
{
    for(j = 0; j < islandSize; j++)
    {
        if(i > 0 && j > 0 && (i < islandSize - 1) && (j < islandSize - 1)) 
        {
            if(pixelArray[i-1,j] > 0 && pixelArray[i-1,j] < 7
            && pixelArray[i,j-1] > 0 && pixelArray[i,j-1] < 7
            && pixelArray[i+1,j] > 0 && pixelArray[i+1,j] < 7
            && pixelArray[i,j+1] > 0 && pixelArray[i,j+1] < 7)
            {
                levelSeed = (pixelArray[i-1,j]+pixelArray[i,j-1]+pixelArray[i,j+1]+pixelArray[i+1,j])/2;
                level = int64(random_range(levelSeed,levelSeed+1));
            }else level = int64(random_range(0,7));
        }else level = int64(random_range(0,7));
        pixelArray[i,j] = level;
        block = collision_point((i-1)*32,(j-1)*32,islandObject,false,true);
        instance_destroy(block);
        block = instance_create((i-1)*32,(j-1)*32,islandObject);
        block.level = level;
    }   
}

return true;
