echo "
██╗    ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗
██║    ██║██╔════╝██║     ██╔════╝██╔═══██╗████╗ ████║██╔════╝
██║ █╗ ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║█████╗  
██║███╗██║██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║██╔══╝  
╚███╔███╔╝███████╗███████╗╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗
 ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝
                                                                                                                                                        
 "

echo "
                                                       
__________          ____    
MMMMMMMMMM         6MMMMb   
/   MM   \        8P    Y8  
    MM           6M      Mb 
    MM           MM      MM 
    MM           MM      MM 
    MM           MM      MM 
    MM           MM      MM 
    MM           YM      M9 
    MM            8b    d8  
   _MM_            YMMMM9   
                           "

echo "  
███████╗    ███████╗ ██████╗  ██████╗██╗███████╗████████╗██╗   ██╗
██╔════╝    ██╔════╝██╔═══██╗██╔════╝██║██╔════╝╚══██╔══╝╚██╗ ██╔╝
█████╗█████╗███████╗██║   ██║██║     ██║█████╗     ██║    ╚████╔╝ 
██╔══╝╚════╝╚════██║██║   ██║██║     ██║██╔══╝     ██║     ╚██╔╝  
██║         ███████║╚██████╔╝╚██████╗██║███████╗   ██║      ██║   
╚═╝         ╚══════╝ ╚═════╝  ╚═════╝╚═╝╚══════╝   ╚═╝      ╚═╝   
                                                                Created By ATH3X BL4CK H4T  "                      
                         
                                                                                                             

# Animation for hacking and installing interface
echo "Initializing F-SOCIETY..."
for i in {1..5}; do
    echo -ne "Loading: ["
    for j in {1..10}; do
        if [ $j -le $i ]; then
            echo -n "#"
        else
            echo -n "."
        fi
    done
    echo -ne "]\r"
    sleep 0.5
done
echo "F-SOCIETY is now ready!"

# Run the second file named main.sh
if [ -f "main.sh" ]; then
    chmod +x main.sh
    ./main.sh
else
    echo "file not found!"
fi
