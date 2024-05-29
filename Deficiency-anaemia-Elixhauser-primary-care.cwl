cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  pernicious-deficiency-anaemia-elixhauser-primary-care---primary:
    run: pernicious-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  deficiency-anaemia-elixhauser-primary-care-unspecified---primary:
    run: deficiency-anaemia-elixhauser-primary-care-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: pernicious-deficiency-anaemia-elixhauser-primary-care---primary/output
  deficiency-anaemia-elixhauser-primary-care---primary:
    run: deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-unspecified---primary/output
  deficiency-anaemia-elixhauser-primary-care-folate---primary:
    run: deficiency-anaemia-elixhauser-primary-care-folate---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care---primary/output
  other-deficiency-anaemia-elixhauser-primary-care---primary:
    run: other-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-folate---primary/output
  folic-deficiency-anaemia-elixhauser-primary-care---primary:
    run: folic-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: other-deficiency-anaemia-elixhauser-primary-care---primary/output
  deficiency-anaemia-elixhauser-primary-care-vitamin---primary:
    run: deficiency-anaemia-elixhauser-primary-care-vitamin---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: folic-deficiency-anaemia-elixhauser-primary-care---primary/output
  sideropenic-deficiency-anaemia-elixhauser-primary-care---primary:
    run: sideropenic-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-vitamin---primary/output
  deficiency-anaemia-elixhauser-primary-care-malabsorption---primary:
    run: deficiency-anaemia-elixhauser-primary-care-malabsorption---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: sideropenic-deficiency-anaemia-elixhauser-primary-care---primary/output
  deficiency-anaemia-elixhauser-primary-care-proteindeficiency---primary:
    run: deficiency-anaemia-elixhauser-primary-care-proteindeficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-malabsorption---primary/output
  deficiency-anaemia-elixhauser-primary-care-plummervinson---primary:
    run: deficiency-anaemia-elixhauser-primary-care-plummervinson---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-proteindeficiency---primary/output
  dietary-deficiency-anaemia-elixhauser-primary-care---primary:
    run: dietary-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-plummervinson---primary/output
  deficiency-anaemia-elixhauser-primary-care-causes---primary:
    run: deficiency-anaemia-elixhauser-primary-care-causes---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: dietary-deficiency-anaemia-elixhauser-primary-care---primary/output
  hypochromic-deficiency-anaemia-elixhauser-primary-care---primary:
    run: hypochromic-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: deficiency-anaemia-elixhauser-primary-care-causes---primary/output
  deficiency---primary:
    run: deficiency---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: hypochromic-deficiency-anaemia-elixhauser-primary-care---primary/output
  megaloblastic-deficiency-anaemia-elixhauser-primary-care---primary:
    run: megaloblastic-deficiency-anaemia-elixhauser-primary-care---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule17
      potentialCases:
        id: potentialCases
        source: deficiency---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule18
      potentialCases:
        id: potentialCases
        source: megaloblastic-deficiency-anaemia-elixhauser-primary-care---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
  inputModule17:
    id: inputModule17
    doc: Python implementation unit
    type: File
  inputModule18:
    id: inputModule18
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
