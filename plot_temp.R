#library(geometry)
library(ncdf4)
library(viridisLite)
try(dev.off(), T)

tricontour <- function(x, y, tri, z, cmap, clim=NULL, oncell=F, cb_horz=F){

	# to do:
        #	handle variable on cell
	#	handle clim (if outside clim col should be NA
	# 	add breaks?
	#	extend to vector variable (seperate function)
	# 	fix asp ratio
		
	x <- x - 360
	XY <- cbind(x, y)

	#if (oncell) # do something easeir proably? tpempc <- temp;  xc <- x; yc <- y 
	#else {
	if (!oncell){
		zc <- apply(matrix(z[tri], ncol=3), 1, mean)
		xc <- matrix(XY[tri,1], ncol=3) 
		yc <- matrix(XY[tri,2], ncol=3)
	}

	# map values to colors in colormap
	zlim <- range(z)
	nlevels <- length(cmap)
	levels <- pretty(zlim, nlevels)
	# TODO: if (is.null(clim)) {clim <- range(zc) } !!! *WHEN* SHOULD LEVELS BE SUBSET
	cidx <- findInterval(zc, levels)

	# set up plot window
	plot.new()
	par(fig=c(0,1,0,1)) #, bty='o')
	plot.window(range(xc), range(yc))
	#plot.window(range(xc), range(yc), asp=1)
	axis(1); axis(2)
	# loop thru/plot all cell
	par(bty='o')
	for (i in 1:nrow(xc)){
	#for (i in 1:1000){
		polygon(xc[i,], yc[i,], col=cmap[cidx[i]], NA)
	}

	# add colorbar
	if (!cb_horz){
		#par(mar=c(0,0,0,0), fig = c(0.875, 0.9, .1,.8), new = T); 
		par(mar=c(0,0,0,0), fig = c(0.85, 0.875, .45,.9), new = T); 
		plot.window(xlim = c(0,1), ylim = range(levels))#, xaxs = "i", yaxs = "i");
		rect(0, levels[-length(levels)], 1, levels[-1], col = cmap, border=NA)
		axis(4)
	}		
	else {
		par(mar=c(0,0,0,0), fig = c(0.5,.9,.8,.85), new = T); 
		plot.window(ylim = c(0,1), xlim = range(levels))#, xaxs = "i", yaxs = "i");
		rect(levels[-length(levels)], 0,  levels[-1], 1, col = cmap)
		axis(1)
	}		

}


#ncid <- nc_open('sample_temps.nc')
ncid <- nc_open('single.nc')
tri <- ncvar_get(ncid, 'nv')
#tri <- as.matrix(read.table('gls21_grd.dat', skip=2,nrow=26210)[,2:4]) # REPLACE THIS WITH NV
#p <- as.matrix(read.table('gls21_grd.dat', skip=26212)[,2:3])
x <- ncvar_get(ncid,'lon') 
y <- ncvar_get(ncid,'lat')

# multi time dims
#TEMP <- ncvar_get(ncid,'temp')[,1,]
#temp <- TEMP[,1]
# single time dim
temp <- ncvar_get(ncid,'temp')[,1]
ncolors <- 20
cmap <- viridis(ncolors)


#pdf('test.pdf')
#tricontour(x, y, tri, temp, cmap, clim=c(3,5))

png('mar18.png')
tricontour(x, y, tri, temp, cmap, cb_horz=F)
dev.off()
