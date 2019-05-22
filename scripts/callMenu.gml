switch(menuIndex)
{
    case 0: //perlin small
    {
        global.genType = "PN";
        room = rm_genislands;
        break;
    }
    case 1: //perlin 2 colour
    {
        global.genType = "PNS";
        room = rm_genislands;
        break;
    }
    case 2: //perlin large
    {
        global.genType = "PNXL";
        room = rm_genislands;
        break;
    }
}
