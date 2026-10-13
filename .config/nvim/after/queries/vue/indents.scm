; extends

; == script 元素缩进 ==
; html_tags 的 indents.scm 明确不缩进 script/style，但 Vue SFC 中它们是代码块，需要缩进
(script_element) @indent.begin

(script_element
  (end_tag
    ">" @indent.end))

(script_element
  (end_tag) @indent.branch)

; == style 元素缩进（同理）==
(style_element) @indent.begin

(style_element
  (end_tag
    ">" @indent.end))

(style_element
  (end_tag) @indent.branch)
