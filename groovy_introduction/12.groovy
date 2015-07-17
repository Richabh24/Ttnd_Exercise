import static java.awt.RenderingHints.*
import java.awt.image.BufferedImage
import javax.imageio.ImageIO

def img = ImageIO.read( new File( '/home/ttnd/Pictures/s1.png' ) )

def scale = 0.5

//int newWidth = img.width * scale
//int newHeight = img.height * scale

new BufferedImage( img.width, img.height, img.type ).with { i ->
  createGraphics().with {
    setRenderingHint( KEY_INTERPOLATION, VALUE_INTERPOLATION_BICUBIC )
    drawImage( img, 0, 0, img.width, img.height, null )
    dispose()
  }
  ImageIO.write( i, 'png', new File( '/home/ttnd/Pictures/s2.png' ) )
}