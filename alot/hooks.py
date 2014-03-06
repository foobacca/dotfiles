from twisted.internet.defer import inlineCallbacks
import re


@inlineCallbacks
def pre_envelope_send(ui, dbm, cmd):
    e = ui.current_buffer.envelope
    if re.match('.*[Aa]ttach', e.body, re.DOTALL) and not e.attachments:
        msg = 'no attachments. send anyway?'
        if not (yield ui.choice(msg, select='yes')) == 'yes':
            raise Exception()
