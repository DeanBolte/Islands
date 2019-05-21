islandSize = 30; //num block

for(i = 0; i < islandSize; i++)
{
    for(j = 0; j < islandSize; j++)
    {
        level = int64(random_range(0,15));
        var block = instance_create(i*32,j*32,islandObject);
        block.level = level;
    }
}

return true;
