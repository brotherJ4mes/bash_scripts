#! /usr/bin/env python
# coding: utf-8

from gimpfu import *

def scale_layer_to_canvas_size(img, layer):
	pdb.gimp_image_undo_group_start(img)
	factor = min (float(img.width) / layer.width,
	float(img.height) / layer.height)
	layer.scale(int(layer.width * factor), int(layer.height * factor))
	layer.set_offsets((img.width - layer.width) / 2,
	(img.height - layer.height) / 2)
	pdb.gimp_image_undo_group_end(img)


register("scale-layer-to-canvas-size",
	"Scale layer to canvas size",
	"Scales the layer to canvas size, keeping the aspect ratio",
	"João S. O. Bueno", "Public domain", "2014",
	N_("Scale layer to canvas size..."),
	"*",
	[(PF_IMAGE, "image",       "Input image", None),
	(PF_DRAWABLE, "layer", "Input drawable", None), ], [],
	scale_layer_to_canvas_size,  menu="<Image>/Layer/",
	)

main()
