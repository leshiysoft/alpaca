CC = g++

# -c  --- только компиляция
# -Wall  --- все предупреждения компилятора включить
CFLAGS = -c -std=c++11 -Wall -I.\include -DALPACA_LOG_ON

LFLAGS=

BUILD_DIR = build

SOURCE_DIR = src

INCLUDE_DIR = src

SOURCES = $(wildcard $(SOURCE_DIR)/*.cpp)

OBJECTS = $(patsubst $(SOURCE_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SOURCES))

TARGET = $(BUILD_DIR)/alpaca

all: $(TARGET)

$(TARGET): $(BUILD_DIR) $(OBJECTS)
	$(CC) -o $(TARGET) $(OBJECTS) $(LFLAGS)

$(BUILD_DIR)/%.o : $(SOURCE_DIR)/%.cpp
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

run: all
	$(TARGET)

clean:
	rm -rf $(BUILD_DIR)

rerun: clean run

reall: clean all
