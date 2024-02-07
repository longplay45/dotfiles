from PIL import Image           
import argparse

def show_image(filename):
    img = Image.open(filename)
    img.show() 

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("file_name", help="Name of the image file to display")
    args = parser.parse_args()
    show_image(args.file_name)