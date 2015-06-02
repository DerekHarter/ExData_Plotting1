PLOTS=plot1.png plot2.png plot3.png plot4.png

all: gen_plots

gen_plots: data/household_power_consumption.txt ${PLOTS}

data/household_power_consumption.txt:
	./get_data.R

plot1.png:
	./plot1.R
plot2.png:
	./plot2.R
plot3.png:
	./plot3.R
plot4.png:
	./plot4.R

clean:
	rm -rf plot[1234].png data
