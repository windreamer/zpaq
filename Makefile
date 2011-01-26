BIN=pzpaq
pzpaq_OBJS=pzpaq.o
BIN_OBJS=$(pzpaq_OBJS)
LIB=zpaq
LIB_OBJS=libzpaq.o libzpaqo.o

.PHONY: clean

all: $(BIN)

pzpaq : $(pzpaq_OBJS) $(LIB)
	$(CXX) $(CXXFLAGS) $(pzpaq_OBJS) -o $(BIN) -lpthread -L. -l$(LIB)

$(LIB) : $(LIB_OBJS)
	$(AR) r lib$(LIB).a $(LIB_OBJS)

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BIN) lib$(LIB).a $(BIN_OBJS) $(LIB_OBJS)
