{
  "cells": [
    {
      "position": {
        "x": 0,
        "y": 0
      },
      "size": {
        "height": 10,
        "width": 10
      },
      "type": "Statechart",
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "attrs": {
        "name": {
          "text": "system_setup_menu"
        },
        "specification": {
          "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\n// Eventos de entrada (interfaz pública para poder hacer clic en simulación)\r\ninterface:\r\n    in event EV_BTN_ENTER\r\n    in event EV_BTN_NEXT\r\n    in event EV_BTN_ESC\r\n\r\n// Variables privadas del modelo\r\ninternal:\r\n    var motor_index : integer = 1"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": 149,
        "y": 406
      },
      "size": {
        "height": 62,
        "width": 115
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MOTOR_1",
          "fontSize": 11
        }
      },
      "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
      "z": 60
    },
    {
      "position": {
        "x": 576,
        "y": 404
      },
      "size": {
        "height": 60,
        "width": 177
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MOTOR_2",
          "fontSize": 11
        }
      },
      "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
      "z": 68
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12"
      },
      "target": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "1.667%",
            "dy": "75%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT / motor_index = 1"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "5435b004-0377-4276-b6a6-b4c085911608",
      "z": 69,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a"
      },
      "target": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "60%",
            "dy": "5%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT / motor_index = 0"
            }
          },
          "position": {
            "distance": 0.4935897435897436,
            "offset": 11,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "d582b9bb-4fd7-4b09-b4ec-1ccfcd684175",
      "z": 69,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 462,
        "y": 654
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "SPEED_A",
          "fontSize": 11
        }
      },
      "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
      "z": 80
    },
    {
      "position": {
        "x": 200,
        "y": 779
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "ON",
          "fontSize": 11
        }
      },
      "id": "7e4bcb66-5f43-4c42-97ec-b98afbdd7387",
      "z": 85
    },
    {
      "position": {
        "x": 200,
        "y": 919
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "OFF",
          "fontSize": 11
        }
      },
      "id": "c2da6625-df45-4ece-97bd-f003588e21b4",
      "z": 86
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "7e4bcb66-5f43-4c42-97ec-b98afbdd7387"
      },
      "target": {
        "id": "c2da6625-df45-4ece-97bd-f003588e21b4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "21.667%",
            "dy": "23.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.825,
            "offset": 38,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "3fd4bca0-6486-4058-8578-b120430ca41a",
      "z": 88,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "c2da6625-df45-4ece-97bd-f003588e21b4"
      },
      "target": {
        "id": "7e4bcb66-5f43-4c42-97ec-b98afbdd7387",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "75%",
            "dy": "63.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.85,
            "offset": 42,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "a6568ff4-07fa-4ae9-9cae-1980d2f6b371",
      "z": 89,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 462,
        "y": 779
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MENOR_0",
          "fontSize": 11
        }
      },
      "id": "5c1f253c-8cb3-4bae-9e64-13f380764da1",
      "z": 90
    },
    {
      "position": {
        "x": 462,
        "y": 919
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "1 A 8",
          "fontSize": 11
        }
      },
      "id": "db25c847-b38a-4600-b6a8-210355f99ca3",
      "z": 91
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4"
      },
      "target": {
        "id": "5c1f253c-8cb3-4bae-9e64-13f380764da1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "21.667%",
            "dy": "10%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ENTER"
            }
          },
          "position": {
            "distance": 0.6230769230769231,
            "offset": 39,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "3"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "d5f6f5a6-d010-4451-983f-ea4db0ad1f6f",
      "z": 93,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "5c1f253c-8cb3-4bae-9e64-13f380764da1"
      },
      "target": {
        "id": "db25c847-b38a-4600-b6a8-210355f99ca3",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.667%",
            "dy": "23.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.75,
            "offset": 36,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "e2256b28-ab19-42f8-8b59-6a02d7c0a2c6",
      "z": 94,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 832,
        "y": 780
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "LEFT",
          "fontSize": 11
        }
      },
      "id": "da7f3f52-8605-48c0-8ba7-1b2f786007a9",
      "z": 98
    },
    {
      "position": {
        "x": 834,
        "y": 915
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "RIGHT",
          "fontSize": 11
        }
      },
      "id": "7a81d494-2007-46be-a22d-98f28a109809",
      "z": 102
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "da7f3f52-8605-48c0-8ba7-1b2f786007a9"
      },
      "target": {
        "id": "7a81d494-2007-46be-a22d-98f28a109809",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "15%",
            "dy": "18.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.86,
            "offset": 37,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "0ed17e18-2bc4-4646-9faa-8b8ca438f739",
      "z": 103,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "7a81d494-2007-46be-a22d-98f28a109809"
      },
      "target": {
        "id": "da7f3f52-8605-48c0-8ba7-1b2f786007a9",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "88.333%",
            "dy": "95%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.7933333333333333,
            "offset": 40,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "c91d7f94-679d-4b34-82cc-645d395f1779",
      "z": 104,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 465,
        "y": 1071
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MAYOR 9",
          "fontSize": 11
        }
      },
      "id": "4d93cd02-5bbe-4749-a725-5d85dde2be2d",
      "z": 120
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "db25c847-b38a-4600-b6a8-210355f99ca3"
      },
      "target": {
        "id": "4d93cd02-5bbe-4749-a725-5d85dde2be2d",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "15%",
            "dy": "13.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.8095238095238095,
            "offset": 34,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "7d92ed3b-8692-4417-86db-e0e5b704aed6",
      "z": 121,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55%",
            "dy": "11.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "48.023%",
            "dy": "81.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 1]"
            }
          },
          "position": {
            "distance": 0.30772610977132286,
            "offset": -8,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "4"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "3dbd72d1-064e-441f-84e8-17454b3e3e17",
      "z": 124,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 515,
          "y": 623
        },
        {
          "x": 661,
          "y": 623
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "11.667%",
            "dy": "51.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "90.435%",
            "dy": "88.71%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 0]"
            }
          },
          "position": {
            "distance": 0.5861935109188191,
            "offset": 10,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "5"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "4d7bc876-501f-4e81-8ffd-1443bcd7e01d",
      "z": 125,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 340,
          "y": 508
        }
      ]
    },
    {
      "position": {
        "x": 822,
        "y": 652
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "SPIN_A",
          "fontSize": 11
        }
      },
      "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e",
      "z": 128
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e"
      },
      "target": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "94.915%",
            "dy": "50%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 1]"
            }
          },
          "position": {
            "distance": 0.9616895697440331,
            "offset": -82.38467407226562,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "3"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "950fdc78-3155-43ef-a9bf-c9448ebabf79",
      "z": 129,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 820,
          "y": 434
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e"
      },
      "target": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "5%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "offset": 6,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "7ecaa3dd-8278-4a05-ab5e-776c47537e0c",
      "z": 129,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "83.333%",
            "dy": "3.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "83.478%",
            "dy": "14.516%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 0]"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "4"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "d2d1a2bd-1865-4b20-b213-0a71ff1f07ad",
      "z": 130,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 660,
          "y": 339
        }
      ]
    },
    {
      "position": {
        "x": 203,
        "y": 655
      },
      "size": {
        "height": 62,
        "width": 100
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "POWER_A",
          "fontSize": 11
        }
      },
      "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
      "z": 132
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.384%",
            "dy": "91.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "71.667%",
            "dy": "25%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ENTER"
            }
          },
          "position": {
            "distance": 0.5310928018402581,
            "offset": 7,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "700c8fdc-bff4-435d-a4cd-cfc67e684025",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 274.67,
          "y": 591
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12"
      },
      "target": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "15%",
            "dy": "18.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ENTER"
            }
          },
          "position": {
            "distance": 0.47049031793114976,
            "offset": 41,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "47da0204-24e0-4908-b380-8e546cdf2d8f",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4"
      },
      "target": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "66.667%",
            "dy": "6.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.5337078651685393,
            "offset": 12,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "f4210420-7510-4801-9b00-a48b5817f17f",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "7%",
            "dy": "33.871%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "91.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 0]"
            }
          },
          "position": {
            "distance": 0.6256178468740236,
            "offset": -85,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "3"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "c761c4bd-bfa9-4fce-b545-0c9977e3d387",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 50,
          "y": 650
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95"
      },
      "target": {
        "id": "0730eb12-0fe7-446e-a5ca-c6e4b74b9c9a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "5.085%",
            "dy": "96.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC [motor_index == 1]"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "4"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "e31bacda-8929-44dc-97da-5b8b9c272d44",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 367,
          "y": 553
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95"
      },
      "target": {
        "id": "7e4bcb66-5f43-4c42-97ec-b98afbdd7387",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "30%",
            "dy": "10%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ENTER"
            }
          },
          "position": {
            "distance": 0.5806451612903226,
            "offset": 38,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "54fc3609-c6ca-4ed5-af07-247c294106ab",
      "z": 133,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "7e4bcb66-5f43-4c42-97ec-b98afbdd7387"
      },
      "target": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "46%",
            "dy": "96.774%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.41935483870967744,
            "offset": 31,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "d166b719-1f6a-454c-835c-9b268b1b675f",
      "z": 134,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "c2da6625-df45-4ece-97bd-f003588e21b4"
      },
      "target": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "4%",
            "dy": "66.129%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.49782353789032713,
            "offset": -33,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "5693b520-e983-46cf-8e22-cda4f4f0cbe9",
      "z": 135,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 91,
          "y": 942
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "5c1f253c-8cb3-4bae-9e64-13f380764da1"
      },
      "target": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "73.333%",
            "dy": "96.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.4230769230769231,
            "offset": 33,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "22e5269a-8a2c-4d50-959e-8b9130311300",
      "z": 136,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f8bc167e-a02a-43bd-91b2-130b42fb4f95"
      },
      "target": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.333%",
            "dy": "60%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "5fdfd598-7f65-4079-89c0-13a0efe56ee5",
      "z": 137,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "100%",
            "dy": "46.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "6.667%",
            "dy": "50%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.5033333333333333,
            "offset": -8,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "062cc489-b898-4391-b75a-f8e7cfea0b2a",
      "z": 138,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "db25c847-b38a-4600-b6a8-210355f99ca3"
      },
      "target": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "5%",
            "dy": "83.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "offset": 29,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "3ff64103-3ba5-4beb-ad89-236be0787413",
      "z": 139,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 374,
          "y": 949
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "4d93cd02-5bbe-4749-a725-5d85dde2be2d"
      },
      "target": {
        "id": "02deb24d-0bfe-4c6f-a717-11b137781ac4",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "95%",
            "dy": "88.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.5046768218706855,
            "offset": -33,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "720f34c1-9e7d-4af8-be1c-a9bdf8327c37",
      "z": 140,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 652,
          "y": 1099
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e"
      },
      "target": {
        "id": "da7f3f52-8605-48c0-8ba7-1b2f786007a9",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.667%",
            "dy": "1.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ENTER"
            }
          },
          "position": {
            "distance": 0.6431080612383812,
            "offset": 42.94750976562512,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "02a11153-f4fa-4e68-b533-0d0c336ca212",
      "z": 141,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 843,
          "y": 743
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "da7f3f52-8605-48c0-8ba7-1b2f786007a9"
      },
      "target": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "86.667%",
            "dy": "65%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.4264705882352941,
            "offset": 37,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "b84f83fb-7d15-4ff6-b1bf-e4facc31bd0f",
      "z": 142,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "7a81d494-2007-46be-a22d-98f28a109809"
      },
      "target": {
        "id": "181f7bb8-4ca8-419a-9009-e1858dbbb03e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "85%",
            "dy": "53.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_ESC"
            }
          },
          "position": {
            "distance": 0.47152003588591523,
            "offset": 36,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "44783a2c-5b32-4759-afe3-8755fc47defa",
      "z": 143,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 990,
          "y": 944
        }
      ]
    },
    {
      "position": {
        "x": 182,
        "y": 235
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MAIN",
          "fontSize": 11
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 147
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "06140153-d681-4f47-9375-fd9d0fec1e12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.667%",
            "dy": "13.333%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "03dac4b2-794a-4828-9231-152874dd14df",
      "z": 148,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 208,
        "y": 156
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {},
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 149,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ]
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 208,
        "y": 171
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 150,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
      "z": 151
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "4d93cd02-5bbe-4749-a725-5d85dde2be2d"
      },
      "target": {
        "id": "5c1f253c-8cb3-4bae-9e64-13f380764da1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "81.667%",
            "dy": "56.667%",
            "rotate": true
          }
        },
        "priority": true
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "EV_BTN_NEXT"
            }
          },
          "position": {
            "distance": 0.7976190476190477,
            "offset": 40,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "id": "23b00987-a853-4097-9a9c-89ef78afb677",
      "z": 152,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": 544,
          "y": 1028
        }
      ]
    }
  ]
}