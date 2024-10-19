/*
This asset is using Machine Learning (ML) component to separate sky, plants and ground.

The ML component outputs a texture uner /ML Resources/ML Output in Resources.
The ML Output produces a colored segmentation texture with each color represesnts:

R - Ground
G - Sky
B - Plants

Try applying ML Output to a screen image to see how it segments the camera feed.

To further customize the template, check out the examples under /Materials/Unlit Examples in Resources.

Duplicate the material, or duplicate the group named 'Custom Segmentation [DUPLICATE_ME]' inside its graph and use it in your onw graph materials.

When applying new materials to screen images, make sure to uncheck Depth Test on the Image component, otherwise images would not display properly.

Happy creating!
*/