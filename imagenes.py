from time import sleep
import cv2
import threading



def colorRojo(nombreArchivo,lock):
    image = cv2.imread(nombreArchivo)
    for x in range (0,374):
        for y in range (0,450):
            image.itemset((x, y, 2), 255)
    cv2.imwrite('Rojo.png',image)
    
    
    combinarColores(0,nombreArchivo,lock)


def colorAzul(nombreArchivo,lock):
    image = cv2.imread(nombreArchivo)
    for x in range (0,374):
        for y in range (0,450):
            image.itemset((x, y, 0), 255)
    cv2.imwrite('Azul.png',image)
    combinarColores(1,nombreArchivo,lock)


def combinarColores(pos,nombreArchivo,lock):
    lock.acquire()
    try:
        image2 = cv2.imread("combinarColores.png")
        if(pos==0):
            for x in range (0,int((len(image2))/2)):
                for y in range (0,(len(image2[0]))):
                    image2.itemset((x, y, 1), 255) 
            cv2.imwrite('combinarColores.png',image2)
        else:
            for x in range (int((len(image2))/2),int((len(image2)))):
                for y in range (0,(len(image2[0]))):
                    image2.itemset((x, y, 2), 255) 
            cv2.imwrite('combinarColores.png',image2) 
    except:
        image2 = cv2.imread(nombreArchivo)
        if(pos==0):
            for x in range (0,int((len(image2))/2)):
                for y in range (0,(len(image2[0]))):
                    image2.itemset((x, y, 0), 255) 
            cv2.imwrite('combinarColores.png',image2)
        else:
            for x in range (int((len(image2))/2),int((len(image2)))):
                for y in range (0,(len(image2[0]))):
                    image2.itemset((x, y, 2), 255) 
            cv2.imwrite('combinarColores.png',image2) 
    lock.release()
lock = threading.Lock()

t1 = threading.Thread(name="hilo_1", target=colorRojo, args=("imagenO.jpg",lock ))
t2 = threading.Thread(name="hilo_1", target=colorAzul, args=("imagenO.jpg",lock ))
t1.start()
t2.start()
t1.join()
t2.join()


cv2.waitKey(0)
cv2.destroyAllWindows()
