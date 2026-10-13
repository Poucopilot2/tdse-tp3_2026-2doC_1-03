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
          "text": "hola"
        },
        "specification": {
          "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\nin event ev_update\nvar row: integer\nvar col: integer\n"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": 200,
        "y": 190
      },
      "size": {
        "height": 60,
        "width": 60
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "IDLE",
          "fontSize": 11
        }
      },
      "id": "6c697e6d-1718-4523-99f8-d230d924a48c",
      "z": 4
    },
    {
      "position": {
        "x": 145,
        "y": 312
      },
      "size": {
        "width": -1,
        "height": -1
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "SET_CURSOR_L1",
          "fontSize": 11
        },
        "specification": {
          "text": "entry / row = 0; col = 0"
        }
      },
      "id": "022073f8-4542-4628-803f-d49d0864cc8e",
      "z": 11
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "6c697e6d-1718-4523-99f8-d230d924a48c"
      },
      "target": {
        "id": "022073f8-4542-4628-803f-d49d0864cc8e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.667%",
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
              "text": "ev_update"
            }
          },
          "position": {
            "offset": -34.000001220703126,
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
      "id": "0eb0d2fc-0da9-4b40-b18e-1e2764e40f0e",
      "z": 12,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 225,
        "y": 130
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {},
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 13,
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
        "x": 225,
        "y": 145
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
      "z": 14,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      "target": {
        "id": "6c697e6d-1718-4523-99f8-d230d924a48c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55%",
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
      "id": "48a2441d-9c28-4605-a746-a9d05c66f7d2",
      "z": 15,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": 177,
        "y": 420
      },
      "size": {
        "width": -1,
        "height": -1
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "WRITE_L1",
          "fontSize": 11
        },
        "specification": {
          "text": "entry / col += 1"
        }
      },
      "id": "77b4fcbc-7a23-4167-9264-2f45707e3c49",
      "z": 17,
      "embeds": [
        "3ab0afda-d3dd-448a-b824-ee8d2b007fb6"
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "022073f8-4542-4628-803f-d49d0864cc8e"
      },
      "target": {
        "id": "77b4fcbc-7a23-4167-9264-2f45707e3c49",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "51.667%",
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
              "text": "after 1 ms"
            }
          },
          "position": {
            "distance": 0.5784313725490197,
            "offset": -32,
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
      "id": "f05e5b9c-d769-44fb-99cc-d0afb0bcabf1",
      "z": 18,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "77b4fcbc-7a23-4167-9264-2f45707e3c49"
      },
      "target": {
        "id": "77b4fcbc-7a23-4167-9264-2f45707e3c49",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "97.826%",
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
              "text": "after 1 ms [col < 16]"
            }
          },
          "position": {
            "distance": 0.5805191144075086,
            "offset": 14.361543626660405,
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
      "id": "3ab0afda-d3dd-448a-b824-ee8d2b007fb6",
      "z": 19,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [],
      "parent": "77b4fcbc-7a23-4167-9264-2f45707e3c49"
    },
    {
      "position": {
        "x": -123,
        "y": 424
      },
      "size": {
        "width": -1,
        "height": -1
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "SET_CURSOR_L2",
          "fontSize": 11
        },
        "specification": {
          "text": "entry / row = 1; col = 0"
        }
      },
      "id": "5d1a43a9-8458-4ef5-ad42-3e30f735cb9d",
      "z": 24
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "77b4fcbc-7a23-4167-9264-2f45707e3c49"
      },
      "target": {
        "id": "5d1a43a9-8458-4ef5-ad42-3e30f735cb9d",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "95.268%",
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
              "text": "after 1 ms [col >= 16]"
            }
          },
          "position": {}
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
      "id": "15b1da42-6048-444a-a434-8518dee0d534",
      "z": 25,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "position": {
        "x": -94,
        "y": 310
      },
      "size": {
        "width": -1,
        "height": -1
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "WRITE_L2",
          "fontSize": 11
        },
        "specification": {
          "text": "entry / col += 1"
        }
      },
      "id": "8b366566-798e-41b4-9470-2a4ba43ab4cc",
      "z": 26,
      "embeds": [
        "4b489383-16da-4ce0-ba03-d839d65e09a1"
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "5d1a43a9-8458-4ef5-ad42-3e30f735cb9d"
      },
      "target": {
        "id": "8b366566-798e-41b4-9470-2a4ba43ab4cc",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "47.591%",
            "dy": "70%",
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
              "text": "after 1 ms"
            }
          },
          "position": {
            "distance": 0.3888888888888889,
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
      "id": "16796f77-8b87-46ee-b3aa-33a5562fd4ac",
      "z": 27,
      "router": {
        "name": "orthogonal"
      },
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "8b366566-798e-41b4-9470-2a4ba43ab4cc"
      },
      "target": {
        "id": "8b366566-798e-41b4-9470-2a4ba43ab4cc",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "4.407%",
            "dy": "61.667%",
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
              "text": "after 1 ms [col < 16]"
            }
          },
          "position": {
            "distance": 0.5611758831296929,
            "offset": 20.626904917589556,
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
      "id": "4b489383-16da-4ce0-ba03-d839d65e09a1",
      "z": 28,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [],
      "parent": "8b366566-798e-41b4-9470-2a4ba43ab4cc"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "8b366566-798e-41b4-9470-2a4ba43ab4cc",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "70.505%",
            "dy": "0%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "6c697e6d-1718-4523-99f8-d230d924a48c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "1.667%",
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
              "text": "after 1 ms [col >= 16]"
            }
          },
          "position": {}
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
      "id": "a3e0a6a3-0eb2-49b7-a88d-96eab69d0fc4",
      "z": 29,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [
        {
          "x": -14,
          "y": 247
        }
      ]
    }
  ]
}