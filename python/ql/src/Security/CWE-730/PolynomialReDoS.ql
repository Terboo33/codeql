/**
 * @name Polynomial regular expression used on uncontrolled data
 * @description A regular expression that can require polynomial time
 *              to match may be vulnerable to denial-of-service attacks.
 * @kind path-problem
 * @problem.severity warning
 * @security-severity 7.5
 * @precision high
 * @id py/polynomial-redos
 * @tags security
 *       external/cwe/cwe-1333
 *       external/cwe/cwe-730
 *       external/cwe/cwe-400
 */

import python
import semmle.python.security.regexp.SuperlinearBackTracking
import semmle.python.security.dataflow.PolynomialReDoSQuery
import DataFlow::PathGraph

from
  Configuration config, DataFlow::PathNode source, DataFlow::PathNode sink, Sink sinkNode,
  PolynomialBackTrackingTerm regexp
where
  config.hasFlowPath(source, sink) and
  sinkNode = sink.getNode() and
  regexp.getRootTerm() = sinkNode.getRegExp()
//   not (
//     source.getNode().(Source).getKind() = "url" and
//     regexp.isAtEndLine()
//   )
select sinkNode.getHighlight(), source, sink,
  "This $@ that depends on a $@ may run slow on strings " + regexp.getPrefixMessage() +
    "with many repetitions of '" + regexp.getPumpString() + "'.", regexp, "regular expression",
  source.getNode(), "user-provided value"
