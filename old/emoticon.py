"""Hangouts emoticon to emoji converter."""


def replace_emoticons(string):
    """Replace emoticon words in string with corresponding emoji."""
    return _replace_words(HANGOUTS_EMOTICONS_TO_EMOJI, string)


def _replace_words(replacements, string):
    """Replace words with corresponding values in replacements dict.

    Words must be separated by spaces or newlines.
    """
    output_lines = []
    for line in string.split('\n'):
        output_words = []
        for word in line.split(' '):
            new_word = replacements.get(word, word)
            output_words.append(new_word)
        output_lines.append(output_words)
    return '\n'.join(' '.join(output_words) for output_words in output_lines)


# Emoticon conversions extracted from hangouts.google.com
HANGOUTS_EMOTICONS_TO_EMOJI = {
    '\+1': '\U0001f44d',
    '\-1': '\U0001f44e',
    '\\alien':'\U0001F47D',
    '\\baby':'\U0001f476',
    '\\bawl': '\U0001F62D',
    '\\beer': '\U0001F37A', 
    '\\bomb': '\U0001F4A3',
    '\\burger': '\U0001F354',
    '\cat': '\U0001f638',
    '<3cat': '\U0001F63B',
    '<3face': '\U0001F60D',
    '\check': '\U00002705',		
    '\clock':'\U000023F0',
    '\crab': '\U0001f980',
    '\cry': '\U0001f62d',
    '\cool': '\U0001f60e',
    '\coffee': '\U00002615',
    '\curl' : '\U0001F4AA',
    '\devil': '\U0001f608',
    '\drink': '\U0001F378',
    '\down': '\U0001F447',
    '\eggplant': '\U0001F346',
    '\\flex' : '\U0001F4AA',
    '\\fam' : '\U0001F46A',
    '\\facepalm' :'\U0001F926',
    '\gun' : '\U0001F52B',
    '\hot' : '\U0001F525',
    '\cheers': '\U0001F37B', 
    '\hat': '\U0001F3A9',
    '\halo': '\U0001f607',
    '\hi5' : '\U0001F64C',
    '\home': '\U0001F3E1',
    '\hockey': '\U0001F3D2',
    '\honey': '\U0001f41d',
    '\hug': '\U0001f917',
    '\kiss': '\U0001f617',
    '\knucks': '\U0001F44A',
    '\loud': '\U0001F4E2',
    '\left': '\U0001F448',
    '\lmao': '\U0001F602',
    '\monkey': '\U0001f435',
    '\milk' : '\U0001F37C',
    '\\no': '\U0001f645',
    '\ok' :  '\U0001F44C',
    '\oh': '\U0001f62e',
    '\pig': '\U0001f437',
    '\pizza': '\U0001F355',
    '\please':'\U0001F64F',
    '\peace':'\U0000270C',
    '\peach':'\U0001F351',
    '\poo': '\U0001f4a9',
    '\question': '\U0001f64b',
    '\\rockon': '\U0001f918',
    '\\right': '\U0001F449',
    '\skull': '\U0001F480',
    '\swim': '\U0001F3CA',
    '\\up': '\U0000261D',
    '\\updown': '\U0001f643',
    '\wave': '\U0001F44B',
    '\wink': '\U0001f60f',
    '\wine': '\U0001F377', 
    '\wrench': '🔧 ',
    '\\xfingers': '\U0001F91E',
    '!:)': '\U0001f643',
    '</3': '\U0001f494',
    '<3': '\U00002764',
    ':D': '\U0001f600',
    '^_^': '\U0001f601',
    '=D': '\U0001f604',
    ';)': '\U0001f609',
    ':)': '\U0000263a',
    '=)': '\U0001f60a',
    ':|': '\U0001f610',
    '-_-': '\U0001f611',
    ':/': '\U0001f615',
    ':p': '\U0001f61c',
    ':(': '\U0001f61e',
    ':o': '\U0001f62e',
    'X(': '\U0001f635',
    ':3': '\U0001f638',
    '\o': '\U0001f64b',
    '\m/': '\U0001f918',
}
