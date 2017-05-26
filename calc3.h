typedef enum { typeCon, typeStrCon, typeCharCon, typeId, typeOpr, typeFunc, typeOneDArray, typeTwoDArray, typeThreeDArray} nodeEnum;

/* constants */
typedef struct {
    int value;                  /* value of constant */
} conNodeType;

/* character constants */
typedef struct {
    char *value;                 /* value of string constant */
} charConNodeType;

/* string constants */
typedef struct {
    char *value;                /* value of string constant */
} strConNodeType;

/* identifiers */
typedef struct {
    char *var_name;             /* subscript to sym array */
    int isGlobal;
} idNodeType;

/* operators */
typedef struct {
    int oper;                   /* operator */
    int nops;                   /* number of operands */
    struct nodeTypeTag *op[1];  /* operands (expandable) */
} oprNodeType;

/* function */
typedef struct {
    char* name; 	      	/* name of the function */
    int argc;			/* count of number of arguments */
    struct nodeTypeTag *args;  	/* function arguments */
    struct nodeTypeTag *op;    	/* statements in the function */
} funcNodeType;

/* 1D Array */
typedef struct {
  struct nodeTypeTag * name;           /* name of the array, it is a nodetype because the "global" info needs to be stored */
  struct nodeTypeTag * index;              /* index of a an array element */
} OneDArrayNodeType;

/* 2D Array */
typedef struct {
  struct nodeTypeTag * name;           /* name of the array, it is a nodetype because the "global" info needs to be stored */
  struct nodeTypeTag * fst_index;              /* first index of a 2D array */
  struct nodeTypeTag * scd_index;              /* second index of a 2D array */
} TwoDArrayNodeType;

/* 3D Array */
typedef struct {
  struct nodeTypeTag * name;           /* name of the array, it is a nodetype because the "global" info needs to be stored */
  struct nodeTypeTag * fst_index;              /* first index of a 3D array */
  struct nodeTypeTag * scd_index;              /* second index of a 3D array */
  struct nodeTypeTag * thd_index;              /* third index of a 3D array */
} ThreeDArrayNodeType;

typedef struct nodeTypeTag {
    nodeEnum type;              /* type of node */

    /* union must be last entry in nodeType */
    /* because operNodeType may dynamically increase */
    union {
      conNodeType con;        /* constants */
      charConNodeType charCon; /* character constants */
      strConNodeType strCon;	/* string constants */
      idNodeType id;          /* identifiers */
      oprNodeType opr;        /* operators */
      funcNodeType func;	/* functions */
      OneDArrayNodeType onedarray; /* 1D Array */
      TwoDArrayNodeType twodarray; /* 2D Array */
      ThreeDArrayNodeType threedarray; /* 3D Array */
    };
} nodeType;

#define TABLE_SIZE 40000
extern char* sym[TABLE_SIZE];

#define MAIN 997
#define CALL 996
