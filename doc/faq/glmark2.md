## Segmentation fault when running glmark2

### glmark2 provided by Ubuntu22.04

#### Install

```console
shell$ sudo apt install glmark2
```

#### Run

```console
shell$ /usr/bin/glmark2
=======================================================
    glmark2 2021.02
=======================================================
    OpenGL Information
    GL_VENDOR:     lima
    GL_RENDERER:   Mali400
    GL_VERSION:    2.1 Mesa 22.0.5 (git-d88d2f3687)
=======================================================
[build] use-vbo=false: FPS: 140 FrameTime: 7.143 ms
[build] use-vbo=true: FPS: 152 FrameTime: 6.579 ms
[texture] texture-filter=nearest: FPS: 137 FrameTime: 7.299 ms
[texture] texture-filter=linear: FPS: 139 FrameTime: 7.194 ms
Segmentation fault
```

### glmark2 built by myself

#### Download

```console
shell$ git clone https://github.com/glmark2/glmark2.git
shell$ cd glmark2/
```

#### Build

##### Prepare packages for build

```console
shell$ sudo apt install libjpeg-dev libx11-dev libpng-dev libdrm-dev libgbm-dev libudev-dev
```

##### Configure

```console
shell$ ./waf configure --with-flavors=x11-gl
```

##### Build

```console
shell$ ./waf
```

#### Install

```console
shell$ sudo ./waf install
```

### Run

```console
shell$ /usr/local/bin/glmark2
=======================================================
    glmark2 2021.12
=======================================================
    OpenGL Information
    GL_VENDOR:      lima
    GL_RENDERER:    Mali400
    GL_VERSION:     2.1 Mesa 22.0.5 (git-d88d2f3687)
    Surface Config: buf=32 r=8 g=8 b=8 a=8 depth=24 stencil=0
    Surface Size:   800x600 windowed
=======================================================
[build] use-vbo=false: FPS: 142 FrameTime: 7.042 ms
[build] use-vbo=true: FPS: 152 FrameTime: 6.579 ms
[texture] texture-filter=nearest: FPS: 146 FrameTime: 6.849 ms
[texture] texture-filter=linear: FPS: 131 FrameTime: 7.634 ms
[texture] texture-filter=mipmap: FPS: 152 FrameTime: 6.579 ms
[shading] shading=gouraud: FPS: 126 FrameTime: 7.937 ms
[shading] shading=blinn-phong-inf: FPS: 76 FrameTime: 13.158 ms
[shading] shading=phong: FPS: 72 FrameTime: 13.889 ms
[shading] shading=cel: FPS: 48 FrameTime: 20.833 ms
[bump] bump-render=high-poly: FPS: 64 FrameTime: 15.625 ms
[bump] bump-render=normals: FPS: 115 FrameTime: 8.696 ms
[bump] bump-render=height: FPS: 93 FrameTime: 10.753 ms
[effect2d] kernel=0,1,0;1,-4,1;0,1,0;: FPS: 43 FrameTime: 23.256 ms
[effect2d] kernel=1,1,1,1,1;1,1,1,1,1;1,1,1,1,1;: FPS: 20 FrameTime: 50.000 ms
[pulsar] light=false:quads=5:texture=false: FPS: 165 FrameTime: 6.061 ms
[desktop] blur-radius=5:effect=blur:passes=1:separable=true:windows=4: FPS: 30 FrameTime: 33.333 ms
[desktop] effect=shadow:windows=4: FPS: 97 FrameTime: 10.309 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 59 FrameTime: 16.949 ms
[buffer] columns=200:interleave=false:update-dispersion=0.9:update-fraction=0.5:update-method=subdata: FPS: 60 FrameTime: 16.667 ms
[buffer] columns=200:interleave=true:update-dispersion=0.9:update-fraction=0.5:update-method=map: FPS: 82 FrameTime: 12.195 ms
[ideas] speed=duration: FPS: 75 FrameTime: 13.333 ms
[jellyfish] <default>: FPS: 47 FrameTime: 21.277 ms
Error: SceneTerrain requires Vertex Texture Fetch support, but GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS is 0
[terrain] <default>: Unsupported
[shadow] <default>: FPS: 60 FrameTime: 16.667 ms
[refract] <default>: FPS: 11 FrameTime: 90.909 ms
[conditionals] fragment-steps=0:vertex-steps=0: FPS: 149 FrameTime: 6.711 ms
[conditionals] fragment-steps=5:vertex-steps=0: FPS: 72 FrameTime: 13.889 ms
[conditionals] fragment-steps=0:vertex-steps=5: FPS: 151 FrameTime: 6.623 ms
[function] fragment-complexity=low:fragment-steps=5: FPS: 90 FrameTime: 11.111 ms
[function] fragment-complexity=medium:fragment-steps=5: FPS: 59 FrameTime: 16.949 ms
[loop] fragment-loop=false:fragment-steps=5:vertex-steps=5: FPS: 96 FrameTime: 10.417 ms
[loop] fragment-steps=5:fragment-uniform=false:vertex-steps=5: FPS: 89 FrameTime: 11.236 ms
[loop] fragment-steps=5:fragment-uniform=true:vertex-steps=5: FPS: 43 FrameTime: 23.256 ms
=======================================================
                                  glmark2 Score: 87 
=======================================================
```

