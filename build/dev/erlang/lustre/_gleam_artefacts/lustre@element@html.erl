-module(lustre@element@html).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src/lustre/element/html.gleam").
-export([html/2, text/1, base/1, head/2, link/1, meta/1, style/2, title/2, body/2, address/2, article/2, aside/2, footer/2, header/2, h1/2, h2/2, h3/2, h4/2, h5/2, h6/2, hgroup/2, main/2, nav/2, section/2, search/2, blockquote/2, dd/2, 'div'/2, dl/2, dt/2, figcaption/2, figure/2, hr/1, li/2, menu/2, ol/2, p/2, pre/2, ul/2, a/2, abbr/2, b/2, bdi/2, bdo/2, br/1, cite/2, code/2, data/2, dfn/2, em/2, i/2, kbd/2, mark/2, q/2, rp/2, rt/2, ruby/2, s/2, samp/2, small/2, span/2, strong/2, sub/2, sup/2, time/2, u/2, var/2, wbr/1, area/1, audio/2, img/1, map/2, track/1, video/2, embed/1, iframe/1, object/1, picture/2, portal/1, source/1, math/2, svg/2, canvas/1, noscript/2, script/2, del/2, ins/2, caption/2, col/1, colgroup/2, table/2, tbody/2, td/2, tfoot/2, th/2, thead/2, tr/2, button/2, datalist/2, fieldset/2, form/2, input/1, label/2, legend/2, meter/2, optgroup/2, option/2, output/2, progress/2, select/2, textarea/2, details/2, dialog/2, summary/2, slot/2, template/2]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

-file("src/lustre/element/html.gleam", 11).
?DOC("\n").
-spec html(
    list(lustre@vdom@vattr:attribute(HJP)),
    list(lustre@vdom@vnode:element(HJP))
) -> lustre@vdom@vnode:element(HJP).
html(Attrs, Children) ->
    lustre@element:element(<<"html"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 18).
-spec text(binary()) -> lustre@vdom@vnode:element(any()).
text(Content) ->
    lustre@element:text(Content).

-file("src/lustre/element/html.gleam", 25).
?DOC("\n").
-spec base(list(lustre@vdom@vattr:attribute(HJX))) -> lustre@vdom@vnode:element(HJX).
base(Attrs) ->
    lustre@element:element(<<"base"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 30).
?DOC("\n").
-spec head(
    list(lustre@vdom@vattr:attribute(HKB)),
    list(lustre@vdom@vnode:element(HKB))
) -> lustre@vdom@vnode:element(HKB).
head(Attrs, Children) ->
    lustre@element:element(<<"head"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 38).
?DOC("\n").
-spec link(list(lustre@vdom@vattr:attribute(HKH))) -> lustre@vdom@vnode:element(HKH).
link(Attrs) ->
    lustre@element:element(<<"link"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 43).
?DOC("\n").
-spec meta(list(lustre@vdom@vattr:attribute(HKL))) -> lustre@vdom@vnode:element(HKL).
meta(Attrs) ->
    lustre@element:element(<<"meta"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 48).
?DOC("\n").
-spec style(list(lustre@vdom@vattr:attribute(HKP)), binary()) -> lustre@vdom@vnode:element(HKP).
style(Attrs, Css) ->
    lustre@element:unsafe_raw_html(<<""/utf8>>, <<"style"/utf8>>, Attrs, Css).

-file("src/lustre/element/html.gleam", 53).
?DOC("\n").
-spec title(list(lustre@vdom@vattr:attribute(HKT)), binary()) -> lustre@vdom@vnode:element(HKT).
title(Attrs, Content) ->
    lustre@element:element(<<"title"/utf8>>, Attrs, [text(Content)]).

-file("src/lustre/element/html.gleam", 63).
?DOC("\n").
-spec body(
    list(lustre@vdom@vattr:attribute(HKX)),
    list(lustre@vdom@vnode:element(HKX))
) -> lustre@vdom@vnode:element(HKX).
body(Attrs, Children) ->
    lustre@element:element(<<"body"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 73).
?DOC("\n").
-spec address(
    list(lustre@vdom@vattr:attribute(HLD)),
    list(lustre@vdom@vnode:element(HLD))
) -> lustre@vdom@vnode:element(HLD).
address(Attrs, Children) ->
    lustre@element:element(<<"address"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 81).
?DOC("\n").
-spec article(
    list(lustre@vdom@vattr:attribute(HLJ)),
    list(lustre@vdom@vnode:element(HLJ))
) -> lustre@vdom@vnode:element(HLJ).
article(Attrs, Children) ->
    lustre@element:element(<<"article"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 89).
?DOC("\n").
-spec aside(
    list(lustre@vdom@vattr:attribute(HLP)),
    list(lustre@vdom@vnode:element(HLP))
) -> lustre@vdom@vnode:element(HLP).
aside(Attrs, Children) ->
    lustre@element:element(<<"aside"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 97).
?DOC("\n").
-spec footer(
    list(lustre@vdom@vattr:attribute(HLV)),
    list(lustre@vdom@vnode:element(HLV))
) -> lustre@vdom@vnode:element(HLV).
footer(Attrs, Children) ->
    lustre@element:element(<<"footer"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 105).
?DOC("\n").
-spec header(
    list(lustre@vdom@vattr:attribute(HMB)),
    list(lustre@vdom@vnode:element(HMB))
) -> lustre@vdom@vnode:element(HMB).
header(Attrs, Children) ->
    lustre@element:element(<<"header"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 113).
?DOC("\n").
-spec h1(
    list(lustre@vdom@vattr:attribute(HMH)),
    list(lustre@vdom@vnode:element(HMH))
) -> lustre@vdom@vnode:element(HMH).
h1(Attrs, Children) ->
    lustre@element:element(<<"h1"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 121).
?DOC("\n").
-spec h2(
    list(lustre@vdom@vattr:attribute(HMN)),
    list(lustre@vdom@vnode:element(HMN))
) -> lustre@vdom@vnode:element(HMN).
h2(Attrs, Children) ->
    lustre@element:element(<<"h2"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 129).
?DOC("\n").
-spec h3(
    list(lustre@vdom@vattr:attribute(HMT)),
    list(lustre@vdom@vnode:element(HMT))
) -> lustre@vdom@vnode:element(HMT).
h3(Attrs, Children) ->
    lustre@element:element(<<"h3"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 137).
?DOC("\n").
-spec h4(
    list(lustre@vdom@vattr:attribute(HMZ)),
    list(lustre@vdom@vnode:element(HMZ))
) -> lustre@vdom@vnode:element(HMZ).
h4(Attrs, Children) ->
    lustre@element:element(<<"h4"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 145).
?DOC("\n").
-spec h5(
    list(lustre@vdom@vattr:attribute(HNF)),
    list(lustre@vdom@vnode:element(HNF))
) -> lustre@vdom@vnode:element(HNF).
h5(Attrs, Children) ->
    lustre@element:element(<<"h5"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 153).
?DOC("\n").
-spec h6(
    list(lustre@vdom@vattr:attribute(HNL)),
    list(lustre@vdom@vnode:element(HNL))
) -> lustre@vdom@vnode:element(HNL).
h6(Attrs, Children) ->
    lustre@element:element(<<"h6"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 161).
?DOC("\n").
-spec hgroup(
    list(lustre@vdom@vattr:attribute(HNR)),
    list(lustre@vdom@vnode:element(HNR))
) -> lustre@vdom@vnode:element(HNR).
hgroup(Attrs, Children) ->
    lustre@element:element(<<"hgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 169).
?DOC("\n").
-spec main(
    list(lustre@vdom@vattr:attribute(HNX)),
    list(lustre@vdom@vnode:element(HNX))
) -> lustre@vdom@vnode:element(HNX).
main(Attrs, Children) ->
    lustre@element:element(<<"main"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 177).
?DOC("\n").
-spec nav(
    list(lustre@vdom@vattr:attribute(HOD)),
    list(lustre@vdom@vnode:element(HOD))
) -> lustre@vdom@vnode:element(HOD).
nav(Attrs, Children) ->
    lustre@element:element(<<"nav"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 185).
?DOC("\n").
-spec section(
    list(lustre@vdom@vattr:attribute(HOJ)),
    list(lustre@vdom@vnode:element(HOJ))
) -> lustre@vdom@vnode:element(HOJ).
section(Attrs, Children) ->
    lustre@element:element(<<"section"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 193).
?DOC("\n").
-spec search(
    list(lustre@vdom@vattr:attribute(HOP)),
    list(lustre@vdom@vnode:element(HOP))
) -> lustre@vdom@vnode:element(HOP).
search(Attrs, Children) ->
    lustre@element:element(<<"search"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 203).
?DOC("\n").
-spec blockquote(
    list(lustre@vdom@vattr:attribute(HOV)),
    list(lustre@vdom@vnode:element(HOV))
) -> lustre@vdom@vnode:element(HOV).
blockquote(Attrs, Children) ->
    lustre@element:element(<<"blockquote"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 211).
?DOC("\n").
-spec dd(
    list(lustre@vdom@vattr:attribute(HPB)),
    list(lustre@vdom@vnode:element(HPB))
) -> lustre@vdom@vnode:element(HPB).
dd(Attrs, Children) ->
    lustre@element:element(<<"dd"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 219).
?DOC("\n").
-spec 'div'(
    list(lustre@vdom@vattr:attribute(HPH)),
    list(lustre@vdom@vnode:element(HPH))
) -> lustre@vdom@vnode:element(HPH).
'div'(Attrs, Children) ->
    lustre@element:element(<<"div"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 227).
?DOC("\n").
-spec dl(
    list(lustre@vdom@vattr:attribute(HPN)),
    list(lustre@vdom@vnode:element(HPN))
) -> lustre@vdom@vnode:element(HPN).
dl(Attrs, Children) ->
    lustre@element:element(<<"dl"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 235).
?DOC("\n").
-spec dt(
    list(lustre@vdom@vattr:attribute(HPT)),
    list(lustre@vdom@vnode:element(HPT))
) -> lustre@vdom@vnode:element(HPT).
dt(Attrs, Children) ->
    lustre@element:element(<<"dt"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 243).
?DOC("\n").
-spec figcaption(
    list(lustre@vdom@vattr:attribute(HPZ)),
    list(lustre@vdom@vnode:element(HPZ))
) -> lustre@vdom@vnode:element(HPZ).
figcaption(Attrs, Children) ->
    lustre@element:element(<<"figcaption"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 251).
?DOC("\n").
-spec figure(
    list(lustre@vdom@vattr:attribute(HQF)),
    list(lustre@vdom@vnode:element(HQF))
) -> lustre@vdom@vnode:element(HQF).
figure(Attrs, Children) ->
    lustre@element:element(<<"figure"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 259).
?DOC("\n").
-spec hr(list(lustre@vdom@vattr:attribute(HQL))) -> lustre@vdom@vnode:element(HQL).
hr(Attrs) ->
    lustre@element:element(<<"hr"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 264).
?DOC("\n").
-spec li(
    list(lustre@vdom@vattr:attribute(HQP)),
    list(lustre@vdom@vnode:element(HQP))
) -> lustre@vdom@vnode:element(HQP).
li(Attrs, Children) ->
    lustre@element:element(<<"li"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 272).
?DOC("\n").
-spec menu(
    list(lustre@vdom@vattr:attribute(HQV)),
    list(lustre@vdom@vnode:element(HQV))
) -> lustre@vdom@vnode:element(HQV).
menu(Attrs, Children) ->
    lustre@element:element(<<"menu"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 280).
?DOC("\n").
-spec ol(
    list(lustre@vdom@vattr:attribute(HRB)),
    list(lustre@vdom@vnode:element(HRB))
) -> lustre@vdom@vnode:element(HRB).
ol(Attrs, Children) ->
    lustre@element:element(<<"ol"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 288).
?DOC("\n").
-spec p(
    list(lustre@vdom@vattr:attribute(HRH)),
    list(lustre@vdom@vnode:element(HRH))
) -> lustre@vdom@vnode:element(HRH).
p(Attrs, Children) ->
    lustre@element:element(<<"p"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 296).
?DOC("\n").
-spec pre(
    list(lustre@vdom@vattr:attribute(HRN)),
    list(lustre@vdom@vnode:element(HRN))
) -> lustre@vdom@vnode:element(HRN).
pre(Attrs, Children) ->
    lustre@element:element(<<"pre"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 304).
?DOC("\n").
-spec ul(
    list(lustre@vdom@vattr:attribute(HRT)),
    list(lustre@vdom@vnode:element(HRT))
) -> lustre@vdom@vnode:element(HRT).
ul(Attrs, Children) ->
    lustre@element:element(<<"ul"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 314).
?DOC("\n").
-spec a(
    list(lustre@vdom@vattr:attribute(HRZ)),
    list(lustre@vdom@vnode:element(HRZ))
) -> lustre@vdom@vnode:element(HRZ).
a(Attrs, Children) ->
    lustre@element:element(<<"a"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 322).
?DOC("\n").
-spec abbr(
    list(lustre@vdom@vattr:attribute(HSF)),
    list(lustre@vdom@vnode:element(HSF))
) -> lustre@vdom@vnode:element(HSF).
abbr(Attrs, Children) ->
    lustre@element:element(<<"abbr"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 330).
?DOC("\n").
-spec b(
    list(lustre@vdom@vattr:attribute(HSL)),
    list(lustre@vdom@vnode:element(HSL))
) -> lustre@vdom@vnode:element(HSL).
b(Attrs, Children) ->
    lustre@element:element(<<"b"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 338).
?DOC("\n").
-spec bdi(
    list(lustre@vdom@vattr:attribute(HSR)),
    list(lustre@vdom@vnode:element(HSR))
) -> lustre@vdom@vnode:element(HSR).
bdi(Attrs, Children) ->
    lustre@element:element(<<"bdi"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 346).
?DOC("\n").
-spec bdo(
    list(lustre@vdom@vattr:attribute(HSX)),
    list(lustre@vdom@vnode:element(HSX))
) -> lustre@vdom@vnode:element(HSX).
bdo(Attrs, Children) ->
    lustre@element:element(<<"bdo"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 354).
?DOC("\n").
-spec br(list(lustre@vdom@vattr:attribute(HTD))) -> lustre@vdom@vnode:element(HTD).
br(Attrs) ->
    lustre@element:element(<<"br"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 359).
?DOC("\n").
-spec cite(
    list(lustre@vdom@vattr:attribute(HTH)),
    list(lustre@vdom@vnode:element(HTH))
) -> lustre@vdom@vnode:element(HTH).
cite(Attrs, Children) ->
    lustre@element:element(<<"cite"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 367).
?DOC("\n").
-spec code(
    list(lustre@vdom@vattr:attribute(HTN)),
    list(lustre@vdom@vnode:element(HTN))
) -> lustre@vdom@vnode:element(HTN).
code(Attrs, Children) ->
    lustre@element:element(<<"code"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 375).
?DOC("\n").
-spec data(
    list(lustre@vdom@vattr:attribute(HTT)),
    list(lustre@vdom@vnode:element(HTT))
) -> lustre@vdom@vnode:element(HTT).
data(Attrs, Children) ->
    lustre@element:element(<<"data"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 383).
?DOC("\n").
-spec dfn(
    list(lustre@vdom@vattr:attribute(HTZ)),
    list(lustre@vdom@vnode:element(HTZ))
) -> lustre@vdom@vnode:element(HTZ).
dfn(Attrs, Children) ->
    lustre@element:element(<<"dfn"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 391).
?DOC("\n").
-spec em(
    list(lustre@vdom@vattr:attribute(HUF)),
    list(lustre@vdom@vnode:element(HUF))
) -> lustre@vdom@vnode:element(HUF).
em(Attrs, Children) ->
    lustre@element:element(<<"em"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 399).
?DOC("\n").
-spec i(
    list(lustre@vdom@vattr:attribute(HUL)),
    list(lustre@vdom@vnode:element(HUL))
) -> lustre@vdom@vnode:element(HUL).
i(Attrs, Children) ->
    lustre@element:element(<<"i"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 407).
?DOC("\n").
-spec kbd(
    list(lustre@vdom@vattr:attribute(HUR)),
    list(lustre@vdom@vnode:element(HUR))
) -> lustre@vdom@vnode:element(HUR).
kbd(Attrs, Children) ->
    lustre@element:element(<<"kbd"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 415).
?DOC("\n").
-spec mark(
    list(lustre@vdom@vattr:attribute(HUX)),
    list(lustre@vdom@vnode:element(HUX))
) -> lustre@vdom@vnode:element(HUX).
mark(Attrs, Children) ->
    lustre@element:element(<<"mark"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 423).
?DOC("\n").
-spec q(
    list(lustre@vdom@vattr:attribute(HVD)),
    list(lustre@vdom@vnode:element(HVD))
) -> lustre@vdom@vnode:element(HVD).
q(Attrs, Children) ->
    lustre@element:element(<<"q"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 431).
?DOC("\n").
-spec rp(
    list(lustre@vdom@vattr:attribute(HVJ)),
    list(lustre@vdom@vnode:element(HVJ))
) -> lustre@vdom@vnode:element(HVJ).
rp(Attrs, Children) ->
    lustre@element:element(<<"rp"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 439).
?DOC("\n").
-spec rt(
    list(lustre@vdom@vattr:attribute(HVP)),
    list(lustre@vdom@vnode:element(HVP))
) -> lustre@vdom@vnode:element(HVP).
rt(Attrs, Children) ->
    lustre@element:element(<<"rt"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 447).
?DOC("\n").
-spec ruby(
    list(lustre@vdom@vattr:attribute(HVV)),
    list(lustre@vdom@vnode:element(HVV))
) -> lustre@vdom@vnode:element(HVV).
ruby(Attrs, Children) ->
    lustre@element:element(<<"ruby"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 455).
?DOC("\n").
-spec s(
    list(lustre@vdom@vattr:attribute(HWB)),
    list(lustre@vdom@vnode:element(HWB))
) -> lustre@vdom@vnode:element(HWB).
s(Attrs, Children) ->
    lustre@element:element(<<"s"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 463).
?DOC("\n").
-spec samp(
    list(lustre@vdom@vattr:attribute(HWH)),
    list(lustre@vdom@vnode:element(HWH))
) -> lustre@vdom@vnode:element(HWH).
samp(Attrs, Children) ->
    lustre@element:element(<<"samp"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 471).
?DOC("\n").
-spec small(
    list(lustre@vdom@vattr:attribute(HWN)),
    list(lustre@vdom@vnode:element(HWN))
) -> lustre@vdom@vnode:element(HWN).
small(Attrs, Children) ->
    lustre@element:element(<<"small"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 479).
?DOC("\n").
-spec span(
    list(lustre@vdom@vattr:attribute(HWT)),
    list(lustre@vdom@vnode:element(HWT))
) -> lustre@vdom@vnode:element(HWT).
span(Attrs, Children) ->
    lustre@element:element(<<"span"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 487).
?DOC("\n").
-spec strong(
    list(lustre@vdom@vattr:attribute(HWZ)),
    list(lustre@vdom@vnode:element(HWZ))
) -> lustre@vdom@vnode:element(HWZ).
strong(Attrs, Children) ->
    lustre@element:element(<<"strong"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 495).
?DOC("\n").
-spec sub(
    list(lustre@vdom@vattr:attribute(HXF)),
    list(lustre@vdom@vnode:element(HXF))
) -> lustre@vdom@vnode:element(HXF).
sub(Attrs, Children) ->
    lustre@element:element(<<"sub"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 503).
?DOC("\n").
-spec sup(
    list(lustre@vdom@vattr:attribute(HXL)),
    list(lustre@vdom@vnode:element(HXL))
) -> lustre@vdom@vnode:element(HXL).
sup(Attrs, Children) ->
    lustre@element:element(<<"sup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 511).
?DOC("\n").
-spec time(
    list(lustre@vdom@vattr:attribute(HXR)),
    list(lustre@vdom@vnode:element(HXR))
) -> lustre@vdom@vnode:element(HXR).
time(Attrs, Children) ->
    lustre@element:element(<<"time"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 519).
?DOC("\n").
-spec u(
    list(lustre@vdom@vattr:attribute(HXX)),
    list(lustre@vdom@vnode:element(HXX))
) -> lustre@vdom@vnode:element(HXX).
u(Attrs, Children) ->
    lustre@element:element(<<"u"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 527).
?DOC("\n").
-spec var(
    list(lustre@vdom@vattr:attribute(HYD)),
    list(lustre@vdom@vnode:element(HYD))
) -> lustre@vdom@vnode:element(HYD).
var(Attrs, Children) ->
    lustre@element:element(<<"var"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 535).
?DOC("\n").
-spec wbr(list(lustre@vdom@vattr:attribute(HYJ))) -> lustre@vdom@vnode:element(HYJ).
wbr(Attrs) ->
    lustre@element:element(<<"wbr"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 542).
?DOC("\n").
-spec area(list(lustre@vdom@vattr:attribute(HYN))) -> lustre@vdom@vnode:element(HYN).
area(Attrs) ->
    lustre@element:element(<<"area"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 547).
?DOC("\n").
-spec audio(
    list(lustre@vdom@vattr:attribute(HYR)),
    list(lustre@vdom@vnode:element(HYR))
) -> lustre@vdom@vnode:element(HYR).
audio(Attrs, Children) ->
    lustre@element:element(<<"audio"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 555).
?DOC("\n").
-spec img(list(lustre@vdom@vattr:attribute(HYX))) -> lustre@vdom@vnode:element(HYX).
img(Attrs) ->
    lustre@element:element(<<"img"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 561).
?DOC(" Used with <area> elements to define an image map (a clickable link area).\n").
-spec map(
    list(lustre@vdom@vattr:attribute(HZB)),
    list(lustre@vdom@vnode:element(HZB))
) -> lustre@vdom@vnode:element(HZB).
map(Attrs, Children) ->
    lustre@element:element(<<"map"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 569).
?DOC("\n").
-spec track(list(lustre@vdom@vattr:attribute(HZH))) -> lustre@vdom@vnode:element(HZH).
track(Attrs) ->
    lustre@element:element(<<"track"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 574).
?DOC("\n").
-spec video(
    list(lustre@vdom@vattr:attribute(HZL)),
    list(lustre@vdom@vnode:element(HZL))
) -> lustre@vdom@vnode:element(HZL).
video(Attrs, Children) ->
    lustre@element:element(<<"video"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 584).
?DOC("\n").
-spec embed(list(lustre@vdom@vattr:attribute(HZR))) -> lustre@vdom@vnode:element(HZR).
embed(Attrs) ->
    lustre@element:element(<<"embed"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 589).
?DOC("\n").
-spec iframe(list(lustre@vdom@vattr:attribute(HZV))) -> lustre@vdom@vnode:element(HZV).
iframe(Attrs) ->
    lustre@element:element(<<"iframe"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 594).
?DOC("\n").
-spec object(list(lustre@vdom@vattr:attribute(HZZ))) -> lustre@vdom@vnode:element(HZZ).
object(Attrs) ->
    lustre@element:element(<<"object"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 599).
?DOC("\n").
-spec picture(
    list(lustre@vdom@vattr:attribute(IAD)),
    list(lustre@vdom@vnode:element(IAD))
) -> lustre@vdom@vnode:element(IAD).
picture(Attrs, Children) ->
    lustre@element:element(<<"picture"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 607).
?DOC("\n").
-spec portal(list(lustre@vdom@vattr:attribute(IAJ))) -> lustre@vdom@vnode:element(IAJ).
portal(Attrs) ->
    lustre@element:element(<<"portal"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 612).
?DOC("\n").
-spec source(list(lustre@vdom@vattr:attribute(IAN))) -> lustre@vdom@vnode:element(IAN).
source(Attrs) ->
    lustre@element:element(<<"source"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 619).
?DOC("\n").
-spec math(
    list(lustre@vdom@vattr:attribute(IAR)),
    list(lustre@vdom@vnode:element(IAR))
) -> lustre@vdom@vnode:element(IAR).
math(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/1998/Math/MathML"/utf8>>,
        <<"math"/utf8>>,
        Attrs,
        Children
    ).

-file("src/lustre/element/html.gleam", 627).
?DOC("\n").
-spec svg(
    list(lustre@vdom@vattr:attribute(IAX)),
    list(lustre@vdom@vnode:element(IAX))
) -> lustre@vdom@vnode:element(IAX).
svg(Attrs, Children) ->
    lustre@element:namespaced(
        <<"http://www.w3.org/2000/svg"/utf8>>,
        <<"svg"/utf8>>,
        Attrs,
        Children
    ).

-file("src/lustre/element/html.gleam", 637).
?DOC("\n").
-spec canvas(list(lustre@vdom@vattr:attribute(IBD))) -> lustre@vdom@vnode:element(IBD).
canvas(Attrs) ->
    lustre@element:element(<<"canvas"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 642).
?DOC("\n").
-spec noscript(
    list(lustre@vdom@vattr:attribute(IBH)),
    list(lustre@vdom@vnode:element(IBH))
) -> lustre@vdom@vnode:element(IBH).
noscript(Attrs, Children) ->
    lustre@element:element(<<"noscript"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 650).
?DOC("\n").
-spec script(list(lustre@vdom@vattr:attribute(IBN)), binary()) -> lustre@vdom@vnode:element(IBN).
script(Attrs, Js) ->
    lustre@element:unsafe_raw_html(<<""/utf8>>, <<"script"/utf8>>, Attrs, Js).

-file("src/lustre/element/html.gleam", 657).
?DOC("\n").
-spec del(
    list(lustre@vdom@vattr:attribute(IBR)),
    list(lustre@vdom@vnode:element(IBR))
) -> lustre@vdom@vnode:element(IBR).
del(Attrs, Children) ->
    lustre@element:element(<<"del"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 665).
?DOC("\n").
-spec ins(
    list(lustre@vdom@vattr:attribute(IBX)),
    list(lustre@vdom@vnode:element(IBX))
) -> lustre@vdom@vnode:element(IBX).
ins(Attrs, Children) ->
    lustre@element:element(<<"ins"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 675).
?DOC("\n").
-spec caption(
    list(lustre@vdom@vattr:attribute(ICD)),
    list(lustre@vdom@vnode:element(ICD))
) -> lustre@vdom@vnode:element(ICD).
caption(Attrs, Children) ->
    lustre@element:element(<<"caption"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 683).
?DOC("\n").
-spec col(list(lustre@vdom@vattr:attribute(ICJ))) -> lustre@vdom@vnode:element(ICJ).
col(Attrs) ->
    lustre@element:element(<<"col"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 688).
?DOC("\n").
-spec colgroup(
    list(lustre@vdom@vattr:attribute(ICN)),
    list(lustre@vdom@vnode:element(ICN))
) -> lustre@vdom@vnode:element(ICN).
colgroup(Attrs, Children) ->
    lustre@element:element(<<"colgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 696).
?DOC("\n").
-spec table(
    list(lustre@vdom@vattr:attribute(ICT)),
    list(lustre@vdom@vnode:element(ICT))
) -> lustre@vdom@vnode:element(ICT).
table(Attrs, Children) ->
    lustre@element:element(<<"table"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 704).
?DOC("\n").
-spec tbody(
    list(lustre@vdom@vattr:attribute(ICZ)),
    list(lustre@vdom@vnode:element(ICZ))
) -> lustre@vdom@vnode:element(ICZ).
tbody(Attrs, Children) ->
    lustre@element:element(<<"tbody"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 712).
?DOC("\n").
-spec td(
    list(lustre@vdom@vattr:attribute(IDF)),
    list(lustre@vdom@vnode:element(IDF))
) -> lustre@vdom@vnode:element(IDF).
td(Attrs, Children) ->
    lustre@element:element(<<"td"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 720).
?DOC("\n").
-spec tfoot(
    list(lustre@vdom@vattr:attribute(IDL)),
    list(lustre@vdom@vnode:element(IDL))
) -> lustre@vdom@vnode:element(IDL).
tfoot(Attrs, Children) ->
    lustre@element:element(<<"tfoot"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 728).
?DOC("\n").
-spec th(
    list(lustre@vdom@vattr:attribute(IDR)),
    list(lustre@vdom@vnode:element(IDR))
) -> lustre@vdom@vnode:element(IDR).
th(Attrs, Children) ->
    lustre@element:element(<<"th"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 736).
?DOC("\n").
-spec thead(
    list(lustre@vdom@vattr:attribute(IDX)),
    list(lustre@vdom@vnode:element(IDX))
) -> lustre@vdom@vnode:element(IDX).
thead(Attrs, Children) ->
    lustre@element:element(<<"thead"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 744).
?DOC("\n").
-spec tr(
    list(lustre@vdom@vattr:attribute(IED)),
    list(lustre@vdom@vnode:element(IED))
) -> lustre@vdom@vnode:element(IED).
tr(Attrs, Children) ->
    lustre@element:element(<<"tr"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 754).
?DOC("\n").
-spec button(
    list(lustre@vdom@vattr:attribute(IEJ)),
    list(lustre@vdom@vnode:element(IEJ))
) -> lustre@vdom@vnode:element(IEJ).
button(Attrs, Children) ->
    lustre@element:element(<<"button"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 762).
?DOC("\n").
-spec datalist(
    list(lustre@vdom@vattr:attribute(IEP)),
    list(lustre@vdom@vnode:element(IEP))
) -> lustre@vdom@vnode:element(IEP).
datalist(Attrs, Children) ->
    lustre@element:element(<<"datalist"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 770).
?DOC("\n").
-spec fieldset(
    list(lustre@vdom@vattr:attribute(IEV)),
    list(lustre@vdom@vnode:element(IEV))
) -> lustre@vdom@vnode:element(IEV).
fieldset(Attrs, Children) ->
    lustre@element:element(<<"fieldset"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 778).
?DOC("\n").
-spec form(
    list(lustre@vdom@vattr:attribute(IFB)),
    list(lustre@vdom@vnode:element(IFB))
) -> lustre@vdom@vnode:element(IFB).
form(Attrs, Children) ->
    lustre@element:element(<<"form"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 786).
?DOC("\n").
-spec input(list(lustre@vdom@vattr:attribute(IFH))) -> lustre@vdom@vnode:element(IFH).
input(Attrs) ->
    lustre@element:element(<<"input"/utf8>>, Attrs, []).

-file("src/lustre/element/html.gleam", 791).
?DOC("\n").
-spec label(
    list(lustre@vdom@vattr:attribute(IFL)),
    list(lustre@vdom@vnode:element(IFL))
) -> lustre@vdom@vnode:element(IFL).
label(Attrs, Children) ->
    lustre@element:element(<<"label"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 799).
?DOC("\n").
-spec legend(
    list(lustre@vdom@vattr:attribute(IFR)),
    list(lustre@vdom@vnode:element(IFR))
) -> lustre@vdom@vnode:element(IFR).
legend(Attrs, Children) ->
    lustre@element:element(<<"legend"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 807).
?DOC("\n").
-spec meter(
    list(lustre@vdom@vattr:attribute(IFX)),
    list(lustre@vdom@vnode:element(IFX))
) -> lustre@vdom@vnode:element(IFX).
meter(Attrs, Children) ->
    lustre@element:element(<<"meter"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 815).
?DOC("\n").
-spec optgroup(
    list(lustre@vdom@vattr:attribute(IGD)),
    list(lustre@vdom@vnode:element(IGD))
) -> lustre@vdom@vnode:element(IGD).
optgroup(Attrs, Children) ->
    lustre@element:element(<<"optgroup"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 823).
?DOC("\n").
-spec option(list(lustre@vdom@vattr:attribute(IGJ)), binary()) -> lustre@vdom@vnode:element(IGJ).
option(Attrs, Label) ->
    lustre@element:element(
        <<"option"/utf8>>,
        Attrs,
        [lustre@element:text(Label)]
    ).

-file("src/lustre/element/html.gleam", 831).
?DOC("\n").
-spec output(
    list(lustre@vdom@vattr:attribute(IGN)),
    list(lustre@vdom@vnode:element(IGN))
) -> lustre@vdom@vnode:element(IGN).
output(Attrs, Children) ->
    lustre@element:element(<<"output"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 839).
?DOC("\n").
-spec progress(
    list(lustre@vdom@vattr:attribute(IGT)),
    list(lustre@vdom@vnode:element(IGT))
) -> lustre@vdom@vnode:element(IGT).
progress(Attrs, Children) ->
    lustre@element:element(<<"progress"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 847).
?DOC("\n").
-spec select(
    list(lustre@vdom@vattr:attribute(IGZ)),
    list(lustre@vdom@vnode:element(IGZ))
) -> lustre@vdom@vnode:element(IGZ).
select(Attrs, Children) ->
    lustre@element:element(<<"select"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 855).
?DOC("\n").
-spec textarea(list(lustre@vdom@vattr:attribute(IHF)), binary()) -> lustre@vdom@vnode:element(IHF).
textarea(Attrs, Content) ->
    lustre@element:element(
        <<"textarea"/utf8>>,
        [lustre@attribute:property(<<"value"/utf8>>, gleam@json:string(Content)) |
            Attrs],
        [lustre@element:text(Content)]
    ).

-file("src/lustre/element/html.gleam", 869).
?DOC("\n").
-spec details(
    list(lustre@vdom@vattr:attribute(IHJ)),
    list(lustre@vdom@vnode:element(IHJ))
) -> lustre@vdom@vnode:element(IHJ).
details(Attrs, Children) ->
    lustre@element:element(<<"details"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 877).
?DOC("\n").
-spec dialog(
    list(lustre@vdom@vattr:attribute(IHP)),
    list(lustre@vdom@vnode:element(IHP))
) -> lustre@vdom@vnode:element(IHP).
dialog(Attrs, Children) ->
    lustre@element:element(<<"dialog"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 885).
?DOC("\n").
-spec summary(
    list(lustre@vdom@vattr:attribute(IHV)),
    list(lustre@vdom@vnode:element(IHV))
) -> lustre@vdom@vnode:element(IHV).
summary(Attrs, Children) ->
    lustre@element:element(<<"summary"/utf8>>, Attrs, Children).

-file("src/lustre/element/html.gleam", 895).
?DOC("\n").
-spec slot(
    list(lustre@vdom@vattr:attribute(IIB)),
    list(lustre@vdom@vnode:element(IIB))
) -> lustre@vdom@vnode:element(IIB).
slot(Attrs, Fallback) ->
    lustre@element:element(<<"slot"/utf8>>, Attrs, Fallback).

-file("src/lustre/element/html.gleam", 903).
?DOC("\n").
-spec template(
    list(lustre@vdom@vattr:attribute(IIH)),
    list(lustre@vdom@vnode:element(IIH))
) -> lustre@vdom@vnode:element(IIH).
template(Attrs, Children) ->
    lustre@element:element(<<"template"/utf8>>, Attrs, Children).
