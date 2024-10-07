# Low Res Project Settings in Godot 4.3
This project is a small prototype made for exploring some options that
Godot provides for setting up games with retro pixel art aesthetics.

Only one scene was created, being it the place where are all
the desired characteristics were tested.
Such scene is located in the `scenes` folder with the name `main.tscn`.

Further in this README are noted the steps followed to be able to acquire
the desired appearence rendering-wise. 

## Project Settings

### Initial width and height
The initial width (`display/window/size/viewport_width`) and
height (`display/window/size/viewport_height`) of the project should be
set to the desired low resolution values. In the case of this project they
are `256` by `144` pixels.

### Width and height override
The width (`display/window/size/window_width_override`) and
height (`display/window/size/window_height_override`) override values should
correspond to the size of the game viewport when scaled.

Such properties must be set so that the project can be scaled and
not shown as a tiny window, like low resolution textures usually are
displayed in high resolution monitors. 

In this project those values are `1280` by `720` pixels.

### Scretch mode
The scretch mode (`display/window/stretch/mode`) should be set to
`"canvas_items"` or `"viewport"` so that the game isn't distorted when
scaled up or down. In this project the `"canvas_items"` value was chosen,
but apparently the `"viewport"` value gives the same result.

### Texture filter
For pixel art aesthetics, the texture rendering method
(`rendering/textures/canvas_textures/default_texture_filter`) must be
set to the `"nearest"` value, instead of the default `"linear"` value,
which makes scaled textures look blurry.

### Snap textures to pixel
If it's desired that the textures shouldn't be able to be displayed in
subpixel positions, either the `rendering/2d/snap/snap_2d_vertices_to_pixel`
or the `rendering/2d/snap/snap_2d_transforms_to_pixel` property should be
marked as `true` (apparently, only one of them should be marked, according
to their hover documentation).

If the textures of `Control` nodes should also behave that way, the
`gui/common/snap_controls_to_pixels` property should be kept `true`, as
it is by default.

Note that making these adjustments may make the textures jitter when moving,
because they will only be rendered in full pixels, and that might not look good,
depending on your intention. Also, that may cause problems when using a moving
camera.

To avoid those problems, in this project it was chosen to leave those settings
unactiveted. That means the `rendering/2d/snap/snap_2d_vertices_to_pixel`,
`rendering/2d/snap/snap_2d_transforms_to_pixel` and
`gui/common/snap_controls_to_pixels` properties were set to `false`.

#### Disclaimer
This project's sprites were taken from
[The Spriters Resource](https://www.spriters-resource.com/).
Originally they are from Nintendo games such as
the GBC Pokémon and Zelda titles.
